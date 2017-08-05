class UsersController < ApplicationController


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

