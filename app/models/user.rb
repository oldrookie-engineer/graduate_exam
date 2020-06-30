class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(google)
  validates :name, presence: true
  has_many :application_documents

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(name: auth.info.name, email: auth.info.email)
    unless user
      user = User.new(name: auth.info.name,
                email: auth.info.email,
                provider: auth.provider,
                uid: auth.uid,
                password: Devise.friendly_token[0,20]
              )
    end
    user.save
    user
  end
end
