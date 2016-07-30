class Skill < ApplicationRecord

	# has_many :service_providers_skills
	# has_many :service_providers, through: :service_providers_skills

	has_and_belongs_to_many :service_providers
  	# accepts_nested_attributes_for :service_providers, allow_destroy: true, reject_if: :all_blank


end
