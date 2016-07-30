class JobApplication < ActiveRecord::Base
	belongs_to :job
	belongs_to :service_provider

	enum status: [:Applied, :Shortlisted, :Rejected, :Interview, :Hold, :Hired]

end
