class User < ActiveRecord::Base
	has_many :dashboards, :dependent => :destroy
	
  validates_uniqueness_of :uid, :scope => :provider
  	
  paginates_per ApplicationHelper::PAGES_PRE_COUNT	
end
