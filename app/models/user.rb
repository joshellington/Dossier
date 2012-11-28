class User < ActiveRecord::Base
  attr_accessible :email, :name, :picture, :provider, :uid

  def self.from_omniauth(auth)
    auth["uid"] = auth["uid"].to_s
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"].to_s
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.picture = self.get_picture(auth["credentials"]["token"])
    end
  end

  def self.get_picture(token)
    url = JSON.parse(open('https://basecamp.com/1775043/api/v1/people/me.json?access_token='+token).read)['avatar_url'].gsub('avatar.gif', 'avatar.96.gif')
  end
end
