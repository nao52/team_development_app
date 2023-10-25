class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create index edit update destroy]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user && @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'ユーザーが削除されました'
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
