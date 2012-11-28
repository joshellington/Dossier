class User < ActiveRecord::Base
  attr_accessible :email, :name, :picture, :provider, :uid

  has_many :links

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
      user.picture = self.get_picture(auth)
    end
  end

  def self.get_picture(auth)
    account_id = nil

    auth["extra"]["accounts"].each do |a|
      if a["product"] == "bcx"
        account_id = a["id"].to_s
      end
    end

    url = JSON.parse(open('https://basecamp.com/'+account_id+'/api/v1/people/me.json?access_token='+auth["credentials"]["token"]).read)['avatar_url'].gsub('avatar.gif', 'avatar.96.gif')
  end
end
