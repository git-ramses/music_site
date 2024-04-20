class UsersController < ApplicationController
  before_action :find_user

  # GET /users/:id
  def show
    set_page_title("Profile")
  end

  # GET /users/:id/edit
  def edit
    set_page_title("Edit Profile")
  end

  # PATCH /users/:id
  def update
    if @user.update(update_params.except(:password))
      flash[:success] = 'User updated!'
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to edit_user_path(@user)
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:username, :password, :bio, :location, :genre)
  end
end
