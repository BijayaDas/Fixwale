class Enquiry < ApplicationRecord

	belongs_to :category
	belongs_to :user

	has_many :replies, dependent: :destroy

end
