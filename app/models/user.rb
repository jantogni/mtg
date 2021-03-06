class User < ActiveRecord::Base
  attr_accessible :email, :name, :oauth_expires_at, :oauth_secret, :oauth_token, :provider, :uid, :image

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image || nil
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret || nil
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      user.save!
    end
  end
end
