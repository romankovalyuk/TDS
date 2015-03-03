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
    par = dashboard_params
    par[:user_id] = current_user.id
  	@devices_location = Dashboard.new(par)
  	if @devices_location.save
       	flash[:success] = "Added successfully."
      	redirect_to dashboards_path
    else
		  render 'new'
	  end  
  end

  def edit
  		
  end

  def destroy	
	    @dashboard = Dashboard.find(params[:id])
	    @dashboard.destroy
	    flash[:success] = "Deleted."
	    redirect_to dashboards_path
    end


  private 
		def dashboard_params
      		params.require(:dashboard).permit(:device_id, :room_id)
   		 end
end
	