class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null:false
      t.string :description, null:false
      t.integer :moderator_id, null:false
      t.timestamps null: false
    end
    add_index :subs, :moderator_id

    create_table :posts do |t|
      t.string :title, null:false
      t.string :url
      t.text :content
      t.integer :sub_id, null:false
      t.integer :author_id, null:false
      t.timestamps null: false
    end
    add_index :posts, :sub_id
    add_index :posts, :author_id
  end
end
