class Public::ClubMembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @club = Club.find(params[:club_id])
    @member = current_user.club_members.build(club_members_params)
    @member.save
    redirect_to public_club_path(@club), success: "参加しました"
  end

  def destroy
    @club = Club.find(params[:club_id])
    @member = ClubMember.find_by(user_id: current_user.id, club_id: @club.id)
    @member.destroy
    redirect_to public_club_path(@club), danger: "脱退しました"
  end

  private

  def club_members_params
    params.permit(:user_id, :club_id)
  end
end
