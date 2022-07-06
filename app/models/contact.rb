class Contact < ApplicationRecord

  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 150 }
  validates :subject, presence: true, length: { in: 1..100 }
  validates :message, presence: true, length: { in: 1..1000 }

end
