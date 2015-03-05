class RoomsController < SecuredController
	
	def index
		@q = Room.ransack(params[:q])
    	@rooms = @q.result(distinct: true).page params[:page]
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
     	@room = Room.new
    end

	def create
		p '!!!!!!!!!!!!!!!!!!!!!!1'
		p room_params

		@room = Room.new(room_params)
		if @room.save
       		flash[:success] = "Added successfully."
      		redirect_to rooms_path
		else
		  render 'new'
		end
	end

	def edit
    	@room = Room.find(params[:id])
  	end

	def update    
		@room = Room.find(params[:id])
	    if @room.update_attributes(room_params)
	      flash[:success] = "Profile updated"
	      redirect_to rooms_path
	    else
	      render 'edit'
	    end
  	end

	def destroy
	    @room = Room.find(params[:id])
	    @room.destroy
	    flash[:success] = "User deleted."
	    redirect_to rooms_path
    end

	private 
		def room_params
      		params.require(:room).permit(:name)
   		 end
end
