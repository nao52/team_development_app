class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create index edit update destroy]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to users_path, danger: t('users.edit.failure')
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url, success: t('users.edit.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to users_url, status: :see_other, success: t('users.destroy.success')
    else
      redirect_to users_url, status: :see_other, danger: t('users.destroy.failure')
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: t('users.create.success')
    else
      flash.now[:danger] = t('users.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
