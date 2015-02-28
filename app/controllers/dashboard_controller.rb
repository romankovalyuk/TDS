class DashboardController < SecuredController
	include AuthHelper
	
  def show
    @user = current_user
  end

  #helper_method :current_user
end
