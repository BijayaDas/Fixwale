class Message < ApplicationRecord

  	validates :full_name, :email, :mobile, :description, :presence => true
	
end
