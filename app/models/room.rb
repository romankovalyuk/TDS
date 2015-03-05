class Room < ActiveRecord::Base
	has_many :dashboards, :dependent => :destroy

	validates :name, presence: true 	
	paginates_per ApplicationHelper::PAGES_PRE_COUNT
end
