class BattlesController < ApplicationController
  before_action :set_battle, only:[:show, :edit, :update, :destroy]
  before_action :past_battle_locked, only:[:edit, :update, :destroy]
  
  def top
    @random_battles = Battle.fetch_random_row_battles(3)
  end
  
  def index
    @battles = Battle.fetch_all_battles_order_desc
  end
  
  def new
    if params[:back]
      @battle = Battle.new(battle_params)
    else
      @battle = Battle.new
    end
  end
    
  def create
    @battle = current_user.battles.new(battle_params)
    if @battle.save
      redirect_to battles_path, notice: "対戦会を作成しました！"
    else
      render :new
    end
  end
  
  def show
    @joined = current_user.participant_managements.find_by(battle_id: @battle.id)
    @comment = @battle.comments.build
    @comments = @battle.comments
  end
  
  def edit
  end
  
  def update
    @battle.update(battle_params)
    redirect_to battles_path
  end
  
  def destroy
    @battle.destroy
    redirect_to battles_path
  end

  private
  def battle_params
    params.require(:battle).permit(:title, :content, :place, :battle_date)
  end
  
  def set_battle
    @battle = Battle.find(params[:id])
  end
  
  def past_battle_locked
    if @battle.battle_date < DateTime.now
      redirect_to battles_path, notice: "過去のイベントに対する操作はできません。"
    end
  end
end
