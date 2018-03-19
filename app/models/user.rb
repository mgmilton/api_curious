class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                  = auth_info.uid
      new_user.username             = auth_info.extra.raw_info.name
      new_user.oauth_token          = auth_info.credentials.token
      new_user.oauth_token_secret   = auth_info.credentials.secret
    end
  end

  private
    def self.update_or_create(auth)
      user = User.find_by(uid: auth[:uid]) || User.new
      user.attributes = {
        uid: auth[:extra][:raw_info][:user_id],
        username: auth[:extra][:raw_info][:name],
        oauth_token: auth[:credentials][:token],
        oauth_token_secret: auth[:credentials][:secret]}
      user.save!
      user
    end
end
