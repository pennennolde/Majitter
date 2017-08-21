class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|

    	t.references	:group,	index: true, foreign_key: true, null: false
    	t.references	:user,	index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
