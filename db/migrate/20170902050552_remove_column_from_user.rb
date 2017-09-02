class RemoveColumnFromUser < ActiveRecord::Migration
  def change

  	# 削除
    # remove_column :users, :provider, :string

    # 削除
    remove_index :users, [:provider, :uid]

    # 追加
    add_index :users, :uid, unique: true

  end
end
