class roomPolicy < ApplicationPolicy
	attr_reader :user, :room

	def initialize(user, room)
		@user = user
		@room = room
	end

	def new?
    	user.has_roles?("Recruitment")
  	end
end