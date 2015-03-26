class DashboardsController < SecuredController
	include AuthHelper
	
  def show
    
  end

  def index
    @q = Dashboard.includes(:user, :room, :device).ransack(params[:q])
    @dashboards = @q.result(distinct: true).page(params[:page])
    @grouped_arts = @dashboards.group_by {|art| art.device_id}

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
    device_id = @dashboard.device_id
    room_id = @dashboard.room_id
    @dashboard.destroy
    send_email_to_next_user(device_id, room_id)
    flash[:success] = "Deleted."
    redirect_to dashboards_path
  end


  private 
		def dashboard_params
      params.require(:dashboard).permit(:device_id, :room_id)
    end

    def send_email_to_next_user (device_id, room_id)
      item = Dashboard.where(device_id: device_id).order('created_at DESC').first()
      room = Room.find(room_id)
      if !!item
        ::UserMailer.sample_email(item.user, item.device, room).deliver
      end
    end
end
