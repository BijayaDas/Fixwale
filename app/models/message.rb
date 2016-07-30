class Message < ActiveRecord::Base

  	validates :name, :email, :mobile, :description, :presence => true
	
end
