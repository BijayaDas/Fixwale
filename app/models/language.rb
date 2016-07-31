class Language < ApplicationRecord
  belongs_to :providers

	enum name: [ :english, :hindi, :oriya, :kannada, :tamil, :telugu, :malayalam, :gujrati, :bengali ]

  	validates :name, :presence => true

  	
end
