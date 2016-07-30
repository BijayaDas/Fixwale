class Domain < ActiveRecord::Base

	belongs_to :parent, :class_name => 'Domain'
  	has_many :children, :class_name => 'Domain', :foreign_key => 'parent_id'
	has_many :bookings
	has_many :jobs
	has_many :service_providers
	has_many :pictures, as: :imageable, :class_name => Picture
	
	validates :name, :description, :presence => true

end
