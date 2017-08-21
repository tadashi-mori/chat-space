class UsersController < ApplicationController

  def index
    @users = User.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user == current_user
      user.update(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end

