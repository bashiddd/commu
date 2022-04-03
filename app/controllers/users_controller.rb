class UsersController < ApplicationController
  # before_action :authenticate_user, {only: [:show]}
  before_action :forbid_login_user, {only: [:login]}
  before_action :ensure_correct_user, {only: [:show]}
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      image_name: "default_user.jpg"
    )

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録が完了しました"
      redirect_to("/commu/top")
    else
      render("users/new")
    end
  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/commu/top")
    else
      @error_message = "ユーザー名またはパスワードが違います"
      @name = params[:name] 
      @password = params[:password]
      render("home/top") 
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
  
end
