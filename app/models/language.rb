class Language < ApplicationRecord
  belongs_to :service_providers

	enum name: [ :english, :hindi, :oriya, :kannada, :tamil, :telugu, :malayalam, :gujrati, :bengali ]

  	validates :name, :presence => true

  	
end
