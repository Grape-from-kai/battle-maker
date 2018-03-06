class ParticipantManagement < ApplicationRecord
    belongs_to :battle
    belongs_to :user
    validates :battle_id, uniqueness: { scope:  :user_id}
end
