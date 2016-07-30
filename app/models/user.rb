class User < ActiveRecord::Base

  enum role: [:recruiter, :service_provider, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :authorizations
  # has_and_belongs_to_many :skills
  # has_and_belongs_to_many :roles

  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :service_providers, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one :vendor, dependent: :destroy
  # has_many :imageables, as: :image
  ratyrate_rater

  def full_name
    self.first_name << " " << self.last_name
  end

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    # binding.pry
    if authorization.user.blank?
      user = current_user || User.where('email = ?', auth["info"]["email"]).first
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0,10]
        user.name = auth.info.name
        user.email = auth.info.email
        if auth.provider == "twitter"
          user.save(:validate => false)
        else
          user.save
        end
      end
      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save
    end
    authorization.user
  end


 
end