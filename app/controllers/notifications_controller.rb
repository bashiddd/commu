class NotificationsController < ApplicationController
  def index
  end

  def request
    commu = Community.find_by(id: params[:id])
    notification = Notification.new(
      receiver_id: commu.created_by,
      sender_id: @current_user.id,
      commu_id: commu.id
    )
    notification.save
    redirect_to("/commu/top")
    
  end
  
end
