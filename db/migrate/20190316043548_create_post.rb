class CreatePost < ActiveRecord::Migration[5.2]
  def change
    unless table_exists? :posts
      create_table :posts do |t|
        t.string :caption
        t.string :location_name
        t.string :longitude
        t.string :lattitude
        t.boolean :public, default: true
        t.integer :share_with, array: true
        t.references :user, index: true, foreign_key: true

        t.timestamps
      end
      add_index :posts, [:user_id, :created_at]
    end
  end
end
