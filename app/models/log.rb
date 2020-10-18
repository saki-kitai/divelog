class Log < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image1, Image1Uploader
  mount_uploader :image2, Image2Uploader
  
  has_many :likes, dependent: :destroy
  
end
