class ShipsController < ApplicationController

	def new
		@ship = Ship.new
	end
	
	def create
   		@ship = Ship.new(ship_params)
    	if @ship.save
    	   redirect_to new_sell_path(current_user)
    	end
  	end

  	def update
		@ship = Ship.find(params[:id])
		if@ship.update(ship_params)
		redirect_to new_sell_path(current_user)
		else
		render :edit
	    end
    end

  def ship_params
    params.require(:ship).permit( :user_id, :last_name, :first_name, :address, :tel, :code)
  end

end
