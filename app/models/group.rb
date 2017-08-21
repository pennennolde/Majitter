class Group < ActiveRecord::Base

	has_many :members, dependent: :destroy # Groupが削除されたとき関連するmembersも削除される
	has_many :users, through: :members

	accepts_nested_attributes_for :members,  :allow_destroy => true # allow_destroy: true ← なぜかエラー　# 関連項目も含めて一度に保存、削除する
	
end
