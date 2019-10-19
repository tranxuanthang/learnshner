class CreateTableBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :test_id
      t.index [:user_id, :test_id]
      t.index [:test_id, :user_id]
    end
  end
end
