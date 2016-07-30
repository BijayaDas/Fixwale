class Price < ActiveRecord::Base

	belongs_to :service_provider

	enum price_type: [:minimum_charge, :one_time, :hourly, :monthly, :yearly]

  	validates :price, :price_type, :service_provider_id, :presence => true


end
