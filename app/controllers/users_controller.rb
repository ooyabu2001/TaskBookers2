class UsersController < ApplicationController
  def index
    @book= Book.new
    @users = User.all
    @user =User.new
  end


  def show
    @user = User.find(params[:id])
    @books=@user.books
    @book=Book.new
  end



  def edit
    user_id =params[:id]
    login_user_id = current_user.id
    unless (user_id.to_i == login_user_id)
      redirect_to books_path
    end

     @user = User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
  if  @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(@user.id)
  else
     render :edit

  end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end


end