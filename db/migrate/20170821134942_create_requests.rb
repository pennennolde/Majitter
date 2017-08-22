class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

    	t.references	:group,	index: true, foreign_key: true, null: false
		t.references	:user,	index: true, foreign_key: true, null: false
		t.integer		:requester_id

      t.timestamps null: false
    end
  end
end
