class Comment < ActiveRecord::Base


	belongs_to :user
	belongs_to :service_provider

	validates :user_id, :description, :service_provider_id, :presence => true
	
	
end
