class UsersController < ApplicationController
  # before_action :signed_in_user, only: [:edit, :update]
  # before_action :correct_user, only: [:edit, :update]



  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    # flash[:notice] = "Signed in successfully."
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    # flash[:notice] = "You have updated user successfully."
    redirect_to user_path(user.id)
   else
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :book, :introduction, :profile_image)
  end

  def corrent_user
   @user = User.find(params[:id])
   redirect_to(new_user_session_path) unless current_user?(@user)
  end
end
