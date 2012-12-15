class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :content
      t.integer :post_id

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
