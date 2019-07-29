class UsersController < ApplicationController
  def show
  	  @user = User.find(params[:id])
  end

  def edit
  	  @user = User.find(params[:id])
      if @user.id != current_user.id
      redirect_to root_path
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        render :edit
      end
  end

  def index
      @user = User.find(params[:id])
      @users = User.page(params[:page]).per(5)
  end

  def destroy
     user = User.find(params[:id])
     if user.destroy
        redirect_to root_path
     end
  end

  private
    def user_params
    	params.require(:user).permit( :last_name, :first_name, :last_kana, :first_kana, :zip_code, :address, :tel, :email)
    end
end
