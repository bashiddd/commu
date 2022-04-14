class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(receiver_id: @current_user.id)
  end

  def apply
    commu = Community.find_by(id: params[:id])
    user = User.find_by(name: commu.created_by)
    notification = Notification.new(
      receiver_id: user.id,
      sender_id: @current_user.id,
      commu_id: commu.id
    )
    notification.save
    redirect_to("/commu/#{commu.id}")
    flash[:notice] = "参加申請しました"
    
  end
  
end
