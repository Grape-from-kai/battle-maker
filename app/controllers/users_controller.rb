class UsersController < ApplicationController
  def show
    #自分の参加対戦会一覧表示したい　
    @participate = current_user.participant_managements.all
  end
end
