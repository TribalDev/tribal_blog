class Category < ActiveRecord::Base
  has_many :posts

  def self.normalize_tag category_params
    topic = category_params[:category]
    if topic == ""
      category = self.find_or_create_by(topic: "general stuff")
    else
      category = self.find_or_create_by(topic: topic)
    end
    category.topic.upcase!
    category.save!
    category
  end

end
