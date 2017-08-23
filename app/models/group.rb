class Group < ActiveRecord::Base

	# has_many :members, dependent: :destroy # Groupが削除されたとき関連するmembersも削除される
	# has_many :requests, dependent: :destroy
	# has_many :users, through: :members
	# has_many :users, through: :requests

	has_many :members, dependent: :destroy # Groupが削除されたとき関連するmembersも削除される
	has_many :requests, dependent: :destroy
	has_many :tweets, -> { order(created_at: :desc) }, dependent: :destroy

	# has_many :member_users, through: :members, class_name: 'User', foreign_key: 'user_id', source: 'user'
	# has_many :request_users, through: :requests, class_name: 'User', foreign_key: 'user_id', source: 'user'
	# has_many :requester, through: :requests, class_name: 'User', foreign_key: 'requester_id', source: 'user'

	has_many :member_users, through: :members, source: 'user'
	has_many :accepters, through: :requests, source: 'accepter'
	has_many :requesters, through: :requests, source: 'requester'


	# accepts_nested_attributes_for :members,  :allow_destroy => true # allow_destroy: true ← なぜかエラー　# 関連項目も含めて一度に保存、削除する
	accepts_nested_attributes_for :requests,  :allow_destroy => true
end
