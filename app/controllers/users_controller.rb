class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録ありがとうございます！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "アップデートしました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #completeフラグを切り換える
  def congratulations
    current_user.toggle(:complete)
    current_user.save!
  end

  private

  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :goal, :message, :image)
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  
end
