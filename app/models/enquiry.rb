class Enquiry < ApplicationRecord

	belongs_to :category
	belongs_to :user

	has_many :replies, dependent: :destroy

	def enquiry_owner(user)
		self.user_id == user.id
	end

end
