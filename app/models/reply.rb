class Reply < ApplicationRecord
	belongs_to :enquiry
	belongs_to :provider

	enum status: [:Applied, :Shortlisted, :Rejected, :Interview, :Hold, :Hired]
end
