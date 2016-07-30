class Cart < ActiveRecord::Base
	belongs_to :user
	belongs_to :service_provider

	validates :reporting_time, :start_date, :user_id, :service_provider_id, :presence => true
	

end
