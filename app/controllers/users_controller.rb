class UsersController < ApplicationController
  def show
  	  @user = User.find(params[:id])
  end

  def update
  	  @user = User.find(params[:id])
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def destroy
      @user = Users.find(params[:id])
      @user.destroy

  private
    def user_params
    	params.require(:user).permit( :last_name, :first_name, :last_kana,:first_kana,:zip_code,:address,:tel,:password,:member_status)
    end
end
