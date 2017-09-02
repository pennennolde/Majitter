class Member < ActiveRecord::Base

	belongs_to :group
	belongs_to :user

	# has_many :tweets, -> { order(created_at: :desc) }

	validate :group_id, presence: true, uniqueness: { scope: [:user_id] }
    validate :user_id, presence: true



end
