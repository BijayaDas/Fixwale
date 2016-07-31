class Price < ApplicationRecord

	belongs_to :provider

	enum price_type: [:minimum_charge, :one_time, :hourly, :monthly, :yearly]

  	validates :price, :price_type, :provider_id, :presence => true


end
