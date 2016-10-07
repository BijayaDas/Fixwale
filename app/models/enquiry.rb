class Enquiry < ApplicationRecord
	acts_as_paranoid
	belongs_to :category
	belongs_to :user

	has_many :replies, dependent: :destroy

	enum status: [:open, :closed]

	def enquiry_owner(user)
		self.user_id == user.id
	end

end
