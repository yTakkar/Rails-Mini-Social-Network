class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :like_by
      t.integer :post

      t.timestamps
    end
  end
end
