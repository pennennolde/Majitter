class Request < ActiveRecord::Base

	belongs_to :group

	# belongs_to :user
	belongs_to :accepter, class_name: 'User', foreign_key: 'user_id'
	belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'


    validate :group_id, presence: true, uniqueness: { scope: [:user_id] }
    validate :user_id, presence: true


	
end
