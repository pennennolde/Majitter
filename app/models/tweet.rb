class Tweet < ActiveRecord::Base

	belongs_to :group
	belongs_to :user
	# belongs_to :member

	# validates_presence_of :group_id, :user_id, :text
    validate :group_id, presence: true
    validate :user_id, presence: true
    validate :text, presence: true, length: { maximum: 140 }




end
