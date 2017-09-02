class AddIndexToTweet < ActiveRecord::Migration
  def change

  	add_index :tweets, [:user_id, :group_id, :created_at]

  end
end
