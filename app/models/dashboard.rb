class Dashboard < ActiveRecord::Base
	belongs_to :user
	belongs_to :device
	belongs_to :room

	#validates_uniqueness_of :device_id, scope: [:user_id]
	validates :user_id, presence: true 	
	validates :device_id, presence: true 	

	paginates_per ApplicationHelper::PAGES_PRE_COUNT

end
