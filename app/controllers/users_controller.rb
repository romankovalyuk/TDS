class UsersController < SecuredController
	include AuthHelper
	
	def index
		@users = User.paginate(page: params[:page], per_page: ApplicationHelper::PAGES_PRE_COUNT)
	end

	def show
	   @user = current_user
	end

    def destroy
       @user = User.find(params[:id])

       @user.destroy
       flash[:success] = "User deleted."
       redirect_to users_url
    end
end
