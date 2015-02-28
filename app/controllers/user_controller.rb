class UserController < SecuredController

	def index
		@users = User.all  #.paginate(page: params[:page], per_page: 1)
	end

	def delete

	end

end
