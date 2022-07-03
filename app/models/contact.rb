class Contact < ApplicationRecord

  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, format: { with: /\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i }, length: { maximum: 150 }
  validates :subject, presence: true, length: { in: 1..100 }
  validates :message, presence: true, length: { in: 1..1000 }

end
