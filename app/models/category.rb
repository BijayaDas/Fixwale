class Category < ApplicationRecord

	has_many :providers

	mount_uploader :avatar, AvatarUploader

end
