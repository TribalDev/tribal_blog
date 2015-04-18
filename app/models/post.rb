class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true,
                    length: { minimum: 20}

  default_scope -> {order('created_at DESC')}

  def self.calculate_pages
    posts_per_page = 10
    total_posts = Post.all.size
    if total_posts % posts_per_page == 0
      total_posts / 10
    else
      (total_posts /10) +1
    end
  end

  def self.paginate(post_index, page)
    Post.limit(10).offset(post_index * 10)
  end

end
