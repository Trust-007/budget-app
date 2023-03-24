class RemoveForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :records, column: :category_id
  end
end
