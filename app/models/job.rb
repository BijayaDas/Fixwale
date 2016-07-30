class Job < ActiveRecord::Base
	belongs_to :domain
	belongs_to :user

	has_many :job_applications, dependent: :destroy



end
