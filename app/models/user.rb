class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :restaurants
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #      user.email = auth.info.email
  #      user.provider = auth.provider
  #      user.uid = auth.uid
  #      user.password = Devise.friendly_token[0,20]
  #   end
  # end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name
      user.profile_image = auth.info.image
      user.save
    end
end

def facebook
  @user = User.from_omniauth(request.env["omniauth.auth"])
if @user.persisted? || @user.save
  debugger
  sign_in_and_redirect root_path, event: :authentication #this will throw if @user is not activated
  set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
else
  session["devise.facebook_data"] = request.env["omniauth.auth"]
  redirect_to new_user_registration_url
end
end

  def apply_omniauth(auth)
  update_attributes(
    provider: auth.provider,
    uid: auth.uid
  )
  end

  def has_facebook_linked?
  self.provider.present? && self.uid.present?
  end

end
