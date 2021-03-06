class BoardComment < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :body, presence: true, length: { maximum: 1000 }

  has_one_attached :board_comments_image
end
