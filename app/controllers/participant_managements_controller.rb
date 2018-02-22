class ParticipantManagementsController < ApplicationController
  
  def create
    join = current_user.participant_managements.create(battle_id: params[:battle_id])
    redirect_to user_path(current_user.id),notice:"「#{join.battle.title}」に参加しました"
  end

  def destroy
    p = ParticipantManagement.find(params[:id])
    p.destroy
    
    redirect_to user_path(current_user.id), notice:"「#{p.battle.title}」の参加を取り消しました"
  end
  
end
