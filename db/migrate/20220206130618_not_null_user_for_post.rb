class NotNullUserForPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :creator_id, :integer, null: false
  end
end
