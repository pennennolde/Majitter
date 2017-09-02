class AddIndexToRequest < ActiveRecord::Migration
  def change

  	add_index 	:requests, [:group_id, :user_id], unique: true

  end
end
