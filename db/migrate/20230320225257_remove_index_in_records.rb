class RemoveIndexInRecords < ActiveRecord::Migration[7.0]
  def change
    remove_index "records", column: [:category_id], name: "index_records_on_category_id"
  end
end
