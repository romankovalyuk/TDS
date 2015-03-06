class DashboardsController < SecuredController
	include AuthHelper
	
  def show
    
  end

  def index
    @q = Dashboard.ransack(params[:q])
    @dashboards = @q.result(distinct: true).page params[:page]
  end

  def new
  	@dashboards = Dashboard.new
  end

  def create
    par = dashboard_params
    par[:user_id] = current_user.id
  	@dashboards = Dashboard.new(par)
  	if @dashboards.save
       	flash[:success] = "Added successfully."
      	redirect_to dashboards_path
    else
		  render 'new'
	  end  
  end

  def edit
  	@dashboard = Dashboard.find(params[:id])
  end

  def update    
    par = dashboard_params
    par[:user_id] = current_user.id
    @dashboaedr = Dashboard.find(params[:id])
    if @dashboaedr.update_attributes(par)
      flash[:success] = "Updated"
      redirect_to dashboards_path
    else
      render 'edit'
    end
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
	