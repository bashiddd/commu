class UsersController < ApplicationController
  # before_action :authenticate_user, {only: [:show]}
  before_action :forbid_login_user, {only: [:login_reload, :new, :new_reload]}
  before_action :ensure_correct_user, {only: [:edit, :update, :update_reload]}
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
    )
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録が完了しました"
      redirect_to("/commu/top")
    else
      flash[:notice] = "すべて入力してください"
      render("users/new")
    end

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    else
      @user.image_name = "default_user.png"
    end
    @user.save
  end

  def new_reload
    @user = User.new(
      name: params[:name],
      password: params[:password],
    )
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録が完了しました"
      redirect_to("/commu/top")
    else
      flash[:notice] = "すべて入力してください"
      render("users/new")
    end

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    else
      @user.image_name = "default_user.png"
    end
    @user.save
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

  def login_reload
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

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]
    @user.bio = params[:bio]
    @user.link = params[:link]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    else
      @user.image_name = "default_user.png"
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def update_reload
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]
    @user.bio = params[:bio]
    @user.link = params[:link]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    else
      @user.image_name = "default_user.png"
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def commu_index
    members = Member.where(user_id: params[:id])
    @commus = []
    members.each {|member|
      @commus.push(Community.find_by(id: member.commu_id))
    }
  end

end
