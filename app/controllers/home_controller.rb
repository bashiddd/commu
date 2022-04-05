class HomeController < ApplicationController
  def top
    if @current_user
      redirect_to("/commu/top")
    end
  end

end
