class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true,
                    length: { minimum: 20}

  default_scope -> {order('created_at DESC')}

  def self.calculate_pages
    posts = Post.all.size
    posts_per_page = 10
    pages = posts / posts_per_page
    total_pages = pages if posts % posts_per_page == 0
    total_pages ||= (pages) + 1
  end

  def self.paginate(post_index, page)
    Post.limit(10).offset(post_index * 10)
  end

  def self.search(query)
    query_search = "%#{query.downcase}%"
    results = Post.where('lower(title) LIKE ?', query_search) + Post.where('lower(text) LIKE ?', query_search)
    results.uniq { |post| post.title }
  end

end
