class Comment < ActiveRecord::Base
	belongs_to :post
	validates :name, presence: true,
               length: { minimum: 3, maximum: 15 }
  	validates :body, presence: true,
               length: { minimum: 20}
end
