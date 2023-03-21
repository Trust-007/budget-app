class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_transactions, :records_id, :record_id
    rename_column :category_transactions, :categories_id, :category_id
  end
end
