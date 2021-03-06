class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
   def show
      @user = User.with_deleted.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if@user.update(user_params)
        redirect_to admin_user_path
      else
        render :edit
      end
  end

  def index
      @users = User.page(params[:page]).per(5)
      @allusers = User.with_deleted
  end

  def destroy
     user = User.find(params[:id])
     user.destroy
     

  end

  private
    def user_params
      params.require(:user).permit( :last_name, :first_name, :last_kana, :first_kana, :zip_code, :address, :tel, :email)
    end
end
