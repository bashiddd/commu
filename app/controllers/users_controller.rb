class UsersController < ApplicationController
  # def show
  #   @user = User.find_by(id: params[:id])
  # end

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
    end
  end
  
end
