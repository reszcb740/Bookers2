class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.requeire(:user).permit(:name, :book, :introduction)
  end
end
