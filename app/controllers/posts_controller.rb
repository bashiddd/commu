class PostsController < ApplicationController
  def index
    @commu = Community.find_by(id: params[:id])
    @posts = Post.where(commu_id: @commu.id)
  end
end
