class Friend < ApplicationRecord
  belongs_to :user

  enum rank: { unrank: 0, iron: 1, bronze: 2, silver: 3, gold: 4, platinum: 5, diamond: 6, master: 7, grandmaster: 8, challenger: 9 }, _prefix: true
  enum vc_status: { unavailable: 0, listening_only: 1, available: 2 }, _prefix: true

  validates :introduction, :active_time, presence: true
  validates :introduction, length: { maximum: 500 }
end
