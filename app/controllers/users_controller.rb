class UsersController < ApplicationController
before_action :authenticate_user! && :authenticate_admin!

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
        redirect_to user_path
      else
        render :edit
      end
  end

  def index
      @user = User.with_deleted(params[:id])
      @users = User.page(params[:page]).per(5)
  end

  def destroy
     user = User.find(params[:id])
     
     if user.destroy
        redirect_to root_path
     end
  end
  def correct_user
  @user = current_user.user.find_by(id: params[:id])
    unless @user
      redirect_to root_url
    end
end

  private
    def user_params
    	params.require(:user).permit( :last_name, :first_name, :last_kana, :first_kana, :zip_code, :address, :tel, :email)
    end
end
