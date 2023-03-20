class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transactions, dependent: :destroy
  has_many :records, through: :category_transactions

  validates :name, presence: true
  validates :icon, presence: true
end