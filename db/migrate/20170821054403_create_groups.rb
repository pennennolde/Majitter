class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

    	t.string	:group_name,		null:false
    	t.string	:group_image_url

      t.timestamps null: false
    end
  end
end
