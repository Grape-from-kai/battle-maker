class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :battles, dependent: :destroy
  has_many :participant_managements, dependent: :destroy
  has_many :participant_battles, through: :participant_managements, source: :battle
  has_many :comments, dependent: :destroy
  
  def self.fetch_participant_battles_ordered_desc(user_id)
    user = User.find(user_id)
    participants = user.participant_managements.joins(:battle).all.order("battles.battle_date DESC")
    return participants
  end
end
