class ClubBoard < ApplicationRecord
  belongs_to :user
  belongs_to :club, dependent: :destroy
  has_many :club_board_comments

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 1000}

  has_one_attached :club_board_image

end
