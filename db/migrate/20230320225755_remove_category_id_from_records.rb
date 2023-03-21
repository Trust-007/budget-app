class RemoveCategoryIdFromRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :category_id
  end
end
