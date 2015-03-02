class Device < ActiveRecord::Base
	belongs_to :room
	has_many :dashboard

	validates :room_id, presence: true 	
end
