class DevicesController < SecuredController
	def index
		@devices = Device.all
	end

	def show
		@device = Device.find(params[:id])
	end

	def new
		@device  = Device.new
	end

	def create
		@device = Device.new(device_params)
		if @device.save
       		flash[:success] = "Added successfully."
      		redirect_to devices_path
		else
		  render 'new'
		end
	end

	def edit
    	@device = Device.find(params[:id])
  	end

	def update    
		@device = Device.find(params[:id])
	    if @device.update_attributes(room_params)
	      flash[:success] = "Device updated"
	      redirect_to rooms_path
	    else
	      render 'edit'
	    end
  	end

	def destroy
	    @device = Device.find(params[:id])
	    @device.destroy
	    flash[:success] = "User deleted."
	    redirect_to rooms_path
    end

	private 
		def device_params
      		params.require(:device).permit(:name, :short_name, :description, :room_id)
   		 end
end
