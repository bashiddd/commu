class MembersController < ApplicationController
  def index
    @commu = Community.find_by(id: params[:id])
    members = Member.where(commu_id: params[:id])
    @members = []
    members.each {|member|
      @members.push(User.find_by(id: member.user_id))
    }
  end

  def approval
    notification = Notification.find_by(id: params[:id])
    member = Member.new(commu_id: notification.commu_id, user_id: notification.sender_id)
    member.save
    notification.destroy
    redirect_to("/notifications/index")
  end

  def rejection
    notification = Notification.find_by(id: params[:id])
    notification.destroy
    redirect_to("/notifications/index")
  end
  
end
