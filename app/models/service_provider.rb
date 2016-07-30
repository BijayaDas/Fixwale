class ServiceProvider < ActiveRecord::Base

	belongs_to :user
	belongs_to :domain

  	has_one :picture, as: :imageable, :class_name => Picture
  	has_one :address, dependent: :destroy
	has_one :background_detail, dependent: :destroy

	has_many :bookings, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :carts, dependent: :destroy
  	has_many :languages, dependent: :destroy
	has_many :work_days, dependent: :destroy
  	has_many :prices, dependent: :destroy
  	has_many :job_applications, dependent: :destroy


	has_many :service_providers_skills
  	# has_many :skills, through: :service_providers_skills

	# has_many :imageables, as: :image
  	

  	ratyrate_rateable "communication", "efficiency", "price", "punctuality", "overall"
	# after_validation :geocode          # auto-fetch coordinates

  	validates :name, :description, :user_id, :domain_id, :presence => true

  	accepts_nested_attributes_for :address
  	# accepts_nested_attributes_for :skills, :allow_destroy => true
  	has_and_belongs_to_many :skills
    accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  # searchable do
	 #    text :name, :description, :location
	 #    text :domain do
	 #      domain.name
	 #    end
	 #    time :created_at
	 #    time :updated_at
  # 	end

  
end
