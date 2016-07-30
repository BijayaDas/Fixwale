class BackgroundDetail < ActiveRecord::Base

	belongs_to :service_provider
	
	validates :document_description, :service_provider_id, :city, :state, :pincode, :mobile, :street, :country, :presence => true

end
