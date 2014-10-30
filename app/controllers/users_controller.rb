class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save #saves with no errors
      flash[:success] = "Thank you for joining Bitsy!"
      redirect_to @user # same as: redirect_to user_url(@user)
    else
      render 'new' # take user to new action
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
