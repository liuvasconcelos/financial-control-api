class Account < ApplicationRecord

  validates :title, presence: true
  validates :value, presence: true
  validates :expire_date, presence: true
  validates :category, presence: true
  validates :status, presence: true
end
