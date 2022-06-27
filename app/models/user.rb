class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends

  has_one_attached :profile_image

  enum is_published: { closed: 0, limited: 1, opened: 2 }

  validates :name, presence: true
  validates :summoner_name, presence: true
  validates :is_published, presence: true
end
