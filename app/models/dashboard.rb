class Dashboard < ActiveRecord::Base
		belongs_to :user
		belongs_to :device

		validates_uniqueness_of :id, scope: [:user_id, :device_id]
end
