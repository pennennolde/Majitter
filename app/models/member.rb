class Member < ActiveRecord::Base

	# belongs_to :member_group, class_name: 'Group', foreign_key: 'group_id'
	# belongs_to :member_user, class_name: 'User', foreign_key: 'user_id'

	belongs_to :group
	belongs_to :user

	# has_many :tweets, -> { order(created_at: :desc) }

end
