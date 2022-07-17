class Club < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, lenght: { maximum: 100 }
  validates :introduction, presence: true, length: { maximum: 1000 }
end
