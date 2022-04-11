class MembersController < ApplicationController
  def index
    @commu = Community.find_by(id: params[:id])
    members = Member.where(commu_id: params[:id])
    @members = []
    members.each {|member|
      @members.push(User.find_by(id: member.user_id))
    }
  end
end
