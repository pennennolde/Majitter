class AddIndexToMembers < ActiveRecord::Migration
  def change

  	add_index 	:members, [:group_id, :user_id], unique: true

  end
end
