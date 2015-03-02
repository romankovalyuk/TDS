class DashboardsController < SecuredController
	include AuthHelper
	
  def show
    
  end

  def index
  	@devices_location = Dashboard.all
  end

  def new
  	@devices_location = Dashboard.new
  end

  def create
  	@devices_location = Dashboard.new(dashboard_params)
  	if @devices_location.save
       	flash[:success] = "Added successfully."
      	redirect_to dashboards_path
    else
		render 'new'
	end

  end

  def edit
  	
  end

  private 
		def dashboard_params
      		params.require(:dashboard).permit(:user_id, :device_id)
   		 end
end
	