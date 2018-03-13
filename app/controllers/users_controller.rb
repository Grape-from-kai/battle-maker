class UsersController < ApplicationController
  def show
    #自分の参加対戦会一覧表示したい
    #対戦会日時で降順でソートしてます
    #参考:https://qiita.com/makitokezuka/items/edca67ed23fa71b90997
    @participate = User.fetch_participant_battles_ordered_desc(current_user.id)
  end
end
