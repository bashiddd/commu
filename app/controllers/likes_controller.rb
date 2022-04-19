class LikesController < ApplicationController

  def new
    post = Post.find_by(id: params[:id])
    like = Like.new(post_id: params[:id], user_id: @current_user.id)
    like.save
    redirect_to("/posts/#{post.commu_id}")
  end
  
  def destroy
    post = Post.find_by(id: params[:id])
    like = Like.find_by(post_id: post.id, user_id: @current_user.id)
    like.destroy
    redirect_to("/posts/#{post.commu_id}")
  end
  
  def index
    post = Post.find_by(id: params[:id])
    likes = Like.where(post_id: post.id)
    @users = []
    likes.each {|like|
      user = User.find_by(id: like.user_id)
      @users.push(user)
    }
  end
end
