class Battle < ApplicationRecord
    belongs_to :user
    has_many :participant_managements,dependent: :destroy
    has_many :users, through: :participant_managements
    has_many :comments, dependent: :destroy
end
