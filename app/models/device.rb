class Device < ActiveRecord::Base
	has_many :dashboards, :dependent => :destroy

	validates :name, presence: true 	
end
