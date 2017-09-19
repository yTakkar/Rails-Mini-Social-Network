class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.integer :view_by
      t.integer :view_to

      t.timestamps
    end
  end
end
