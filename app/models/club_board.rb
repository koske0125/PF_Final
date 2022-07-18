class ClubBoard < ApplicationRecord
  belongs_to :user
  belongs_to :club, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 1000}

  has_one_atacched :club_board_image

end
