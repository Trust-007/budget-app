class CategoryTransaction < ApplicationRecord
  belongs_to :records
  belongs_to :categories
end
