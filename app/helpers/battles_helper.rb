module BattlesHelper
  def organizer?(battle)
    if battle.user == current_user
      return true
    end
  end
end
