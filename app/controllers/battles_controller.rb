class BattlesController < ApplicationController
  def index
    @battles = Battle.all
  end
  
  def new
    if params[:back]
      @battle = Battle.new(battle_params)
    else
      @battle = Battle.new
    end
  end
    
  def create
    @battle = Battle.new(battle_params)
    @battle.save
  end
  
  private
  def battle_params
    params.require(:battle).permit(:title, :content, :place, :battle_date, :user_id)
  end
end
