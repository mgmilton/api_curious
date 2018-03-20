class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                  = auth_info.uid
      new_user.username             = auth_info.extra.raw_info.login
      new_user.avatar               = auth_info.extra.raw_info.avatar_url
      new_user.name                 = auth_info.extra.raw_info.name
      new_user.oauth_token          = auth_info.credentials.token
    end
  end

  private
    def self.update_or_create(auth)
      user = User.find_by(uid: auth[:uid]) || User.new
      user.attributes = {
        uid: auth[:extra][:raw_info][:user_id],
        username: auth[:extra][:raw_info][:name],
        oauth_token: auth[:credentials][:token]}
      user.save!
      user
    end
end
