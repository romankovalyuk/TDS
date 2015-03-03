class Room < ActiveRecord::Base
	has_many :dashboards

	validates :name, presence: true 	
	
end
