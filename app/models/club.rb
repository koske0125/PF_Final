class Club < ApplicationRecord
  belongs_to :user
  has_many :club_members
  has_many :club_boards

  validates :name, presence: true, length: { maximum: 100 }
  validates :introduction, presence: true, length: { maximum: 1000 }
end
