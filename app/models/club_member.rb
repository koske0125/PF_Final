class ClubMember < ApplicationRecord
  belongs_to :user
  belongs_to :club_member
end
