class Battle < ApplicationRecord
  belongs_to :user
  has_many :participant_managements, dependent: :destroy
  has_many :users, through: :participant_managements
  has_many :comments, dependent: :destroy
  
  validates :title, length: { in: 1..50 }
  validate :battle_date_cannot_be_in_the_past
  validates :place, length: { maximum: 200 }
  validates :content, length: { maximum: 1000 }
    
  #住所から緯度経度に変換
  geocoded_by :place
  after_validation :geocode, if: :place_changed?
    
  def battle_date_cannot_be_in_the_past
    if battle_date.present? && battle_date < DateTime.now
      errors.add(:battle_date, "は現在以降の日時を入力してください。") 
    end
  end
  
  def self.fetch_random_row_battles(want)
    battles = Battle.where("battle_date >= ?", DateTime.now)
    slice_battles = battles.shuffle.slice(0..want-1)
    slice_battles.sort! do |a,b|
      a[:battle_date] <=> b[:battle_date]
    end
    slice_battles.reverse
  end
  
  def self.fetch_all_battles_order_desc
    Battle.all.order("battle_date DESC")
  end
end
