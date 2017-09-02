class Request < ActiveRecord::Base

	belongs_to :group

	# belongs_to :user
	belongs_to :accepter, class_name: 'User', foreign_key: 'user_id'
	belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'

	validates :group_id, uniqueness: { scope: [:user_id] }
    # validates :group_id, presence: true, uniqueness: { scope: [:user_id] }
    # validates :user_id, presence: true

end
