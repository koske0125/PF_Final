class Club < ApplicationRecord
  belongs_to :user
  has_many :club_members, dependent: :destroy
  has_many :club_boards, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :introduction, presence: true, length: { maximum: 1000 }
end
