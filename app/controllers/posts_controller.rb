class PostsController < ApplicationController
  def index
    @commu = Community.find_by(id: params[:id])
    @posts = Post.where(commu_id: @commu.id)
    @posts = @posts.order(created_at: :desc)
  end

  def new
    @commu = Community.find_by(id: params[:id])
    @post = Post.new
  end

  def create
    @commu = Community.find_by(id: params[:id])
    @post = Post.new(commu_id: @commu.id,
      user_id: @current_user.id,
      content: params[:content]
    )

    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/#{@commu.id}")
    else
      flash[:notice] = "空白では投稿できません"
      render("posts/new")
    end
    
  end

  def create_reload
    @commu = Community.find_by(id: params[:id])
    @post = Post.new(commu_id: @commu.id,
      user_id: @current_user.id,
      content: params[:content]
    )

    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/#{@commu.id}")
    else
      flash[:notice] = "空白では投稿できません"
      render("posts/new")
    end

  end
  
end
