class Category < ApplicationRecord

	belongs_to :parent, :class_name => 'Category'
  	has_many :childrens, :class_name => 'Category', :foreign_key => 'parent_id'
  	
	has_many :providers

	mount_uploader :avatar, AvatarUploader

end
