class ParticipantManagementsController < ApplicationController
  
  def create
    join = ParticipantManagement.create(battle_id: params[:battle_id],user_id: current_user.id)
    redirect_to user_path(current_user.id),notice:"「#{join.battle.title}」に参加しました"
  end

  def destroy
    p = ParticipantManagement.find(params[:id])
    p.destroy
    redirect_to user_path(current_user.id), notice:"「#{p.battle.title}」の参加を取り消しました"
  end
  
end