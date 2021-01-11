class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :AuthorId
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, :AuthorId
    add_index :comments, :post_id
  end
end
