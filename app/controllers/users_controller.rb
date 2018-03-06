class UsersController < ApplicationController
  def show
    #自分の参加対戦会一覧表示したい。
    #対戦会日時で降順でソートしてます
    #参考:https://qiita.com/makitokezuka/items/edca67ed23fa71b90997
    @participate = current_user.participant_managements.joins(:battle).all.order("battles.battle_date DESC")
  end
end
