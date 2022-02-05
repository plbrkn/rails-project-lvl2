class AddUniqueIndexForPostLikeToPostToUser < ActiveRecord::Migration[6.1]
  def change
    add_index :post_likes, %i[user_id post_id], unique: true
  end
end
