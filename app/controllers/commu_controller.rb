class CommuController < ApplicationController
  before_action :authenticate_user, {only: [:top]}

  def top
  end

  def create
    
  end
end
