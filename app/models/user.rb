class User < ActiveRecord::Base
	has_many :dashboards
	
  	validates_uniqueness_of :uid, :scope => :provider
end
