class User < ActiveRecord::Base
	has_many :devices_location
	
  	validates_uniqueness_of :uid, :scope => :provider
end
