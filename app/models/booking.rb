class Booking < ActiveRecord::Base

	belongs_to :user
	belongs_to :address
	belongs_to :domain
	belongs_to :service_provider
	belongs_to :user
	has_one :payment

	enum status: [:booked, :confirmed, :cancelled, :dispatched, :delivered, :paid, :refunded]
	enum shipping_method: [:free]
	enum payment_type: [:Cash]
	enum booking_type: [:interview, :work]


	validates :reporting_time, :start_date, :user_id, :address_id, :service_provider_id, :presence => true
	
end
