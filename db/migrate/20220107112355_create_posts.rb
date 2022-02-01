class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.references :post_category, null: false, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
