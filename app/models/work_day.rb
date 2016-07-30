class WorkDay < ActiveRecord::Base

	belongs_to :service_provider
	
	enum shift: [:morning, :after_noon, :evening, :mid_night, :day, :night, :any]

end
