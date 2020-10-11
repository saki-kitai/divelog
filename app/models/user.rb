class User < ApplicationRecord
    
    has_secure_password
    
    
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    
    # no validation for profile_picture for now
    
    mount_uploader :profile_picture, ProfilePictureUploader
end
