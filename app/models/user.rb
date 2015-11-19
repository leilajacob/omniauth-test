class User < ActiveRecord::Base
	def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  # the following code pulls user avatars from FB:

  def largeimage
    "http://graph.facebook.provider.com/#{self.uid}/picture?type=large"
  end
  
  def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
	end
end
