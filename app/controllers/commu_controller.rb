class CommuController < ApplicationController
  before_action :authenticate_user, {only: [:top]}

  def top
  end

  def new
    @commu = Community.new
  end

  def create
  end

end
