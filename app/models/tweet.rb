class Tweet < ActiveRecord::Base

	belongs_to :group
	belongs_to :user
	# belongs_to :member

	default_scope -> { order(created_at: :desc) }

	# validates_presence_of :group_id, :user_id, :text
    validates :group_id, presence: true
    validates :user_id, presence: true
    validates :text, presence: true, length: { maximum: 140 }




end
