class Member < ActiveRecord::Base

	belongs_to :group
	belongs_to :user

	# has_many :tweets, -> { order(created_at: :desc) }

	validates :group_id, presence: true, uniqueness: { scope: [:user_id] }
    validates :user_id, presence: true



end
