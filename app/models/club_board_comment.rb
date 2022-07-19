class ClubBoardComment < ApplicationRecord
  belongs_to :user
  belongs_to :club_board

  validates :body, presence: true, length: { maximum: 1000}

  has_one_attached :club_board_comments_image
end
