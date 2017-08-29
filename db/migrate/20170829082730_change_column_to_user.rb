class ChangeColumnToUser < ActiveRecord::Migration
  def change

  	rename_column :users, :nickname, :user_name

  	# 追加
    add_column :users, :account_name, :string, :after => :user_name
    add_column :users, :description, :text
    add_column :users, :background_image_url, :string

  end
end
