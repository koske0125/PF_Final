class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, dependent: :destroy
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_one_attached :profile_image

  enum is_published: { closed: 0, limited: 1, opened: 2 }

  validates :name, presence: true
  validates :summoner_name, presence: true
  validates :is_published, presence: true
  # validate :profile_image_size 新規登録時にエラーが出るため、一時的に無効化




  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  def profile_image_size
    if profile_image.blob.byte_size > 5.megabytes
      errors.add(:profile_image,"は5MB以内にしてください")
    end
  end

end
