class Group < ActiveRecord::Base

	has_many :members, dependent: :destroy # Groupが削除されたとき関連するmembersも削除される
	has_many :requests, dependent: :destroy
	# has_many :tweets, -> { order(created_at: :desc) }, dependent: :destroy
	has_many :tweets, dependent: :destroy


	has_many :member_users, through: :members, source: 'user'
	has_many :accepters, through: :requests, source: 'accepter'
	has_many :requesters, through: :requests, source: 'requester'


	# accepts_nested_attributes_for :members,  :allow_destroy => true # allow_destroy: true ← なぜかエラー　# 関連項目も含めて一度に保存、削除する
	# accepts_nested_attributes_for :requests,  :allow_destroy => true


  	validates :group_name, presence: true, length: { maximum: 20 }


end
