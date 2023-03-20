class CategoriesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categorys do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_foreign_key :categorys, :users, column: :user_id
    add_index :categorys, :user_id
  end
end
