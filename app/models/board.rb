class Board < ApplicationRecord
  belongs_to :user
  has_many :board_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }

  has_one_attached :board_image
end
