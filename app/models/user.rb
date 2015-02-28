class User < ActiveRecord::Base
	#attr_accessible :name, :email, :provider, :uid, :refresh_token, :access_token, :expires

  	validates_uniqueness_of :uid, :scope => :provider
end
