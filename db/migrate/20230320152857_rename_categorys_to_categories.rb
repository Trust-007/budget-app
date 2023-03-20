class RenameCategorysToCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table('categorys', 'categories')
  end
end
