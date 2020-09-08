class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google]
  validates :name, presence: true
  has_many :application_documents, dependent: :destroy

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    user ||= User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid: auth.uid,
                      password: Devise.friendly_token[0, 20])
    user.save
    user
  end

  def self.guest
    find_or_create_by!(name: 'master', email: '12@ab.com') do |user|
      user.password = 'adminpass'
    end
  end
end
