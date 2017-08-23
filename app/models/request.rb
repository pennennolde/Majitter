class Request < ActiveRecord::Base

	# belongs_to :request_group, class_name: 'Group', foreign_key: 'group_id'
	# belongs_to :request_user, class_name: 'User', foreign_key: 'user_id'

	belongs_to :group

	# belongs_to :user
	belongs_to :accepter, class_name: 'User', foreign_key: 'user_id'
	belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
	
end
