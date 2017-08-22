class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|

    	t.references	:group,	index: true, foreign_key: true, null: false
    	t.references	:user,	index: true, foreign_key: true, null: false
    	t.string		:text,	null: false
    	t.string		:image_url

      t.timestamps null: false
    end
  end
end
