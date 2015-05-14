class Image < ActiveRecord::Base
  belongs_to :post
  mount_uploader :url, ImageUploader
end
