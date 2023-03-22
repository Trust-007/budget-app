class Record < ApplicationRecord
  belongs_to :user
  has_many :category_transactions, dependent: :destroy
  has_many :categories, through: :category_transactions

  validates :name, presence: true
  validates :amount, numericality: { only_integer: false, greater_than: 0 }
end
