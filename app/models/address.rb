class Address < ApplicationRecord

	belongs_to :user
	belongs_to :provider
	belongs_to :enquiry

	validates :street1, :city, :state, :pincode, :mobile, :user_id, :country, :presence => true

	enum address_type: [ :residentioal, :office, :commercial ]
	# before_save :save_address_details

	# protected

	  def self.save_address_details(address, user_id)
	  	add = {} #only sanitizing parameters. removed geocode becoz of inconsistencies.
	    # data = Geocoder.search(address[:pincode]).first
		    add[:street1] = address[:street1]
		    add[:street2] = address[:street2]
		    add[:city] = address[:city]
		    add[:mobile] = address[:mobile].to_i
		    add[:state] = address[:state]
		    add[:country] = address[:country]
		    add[:pincode] = address[:pincode].to_i
		    add[:address_type] = address[:address_type]
		    add[:user_id] = user_id

		    return add
		
	  end
		
end
