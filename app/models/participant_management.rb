class ParticipantManagement < ApplicationRecord
    belongs_to :battle
    belongs_to :user
end
