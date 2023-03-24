class CreateRecordsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, default: 0.00
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
    add_foreign_key :records, :users, column: :user_id
    add_foreign_key :records, :categorys, column: :category_id
    add_index :records, :user_id
    add_index :records, :category_id
  end
end
