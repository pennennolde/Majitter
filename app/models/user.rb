class User < ActiveRecord::Base

  has_many :members, dependent: :destroy

  has_many :accepter_requests, dependent: :destroy, class_name: 'Request', foreign_key: 'user_id'
  has_many :requester_requests, dependent: :destroy, class_name: 'Request', foreign_key: 'requester_id'
  
  has_many :tweets, -> { order(created_at: :desc) }, dependent: :destroy


  has_many :member_groups, through: :members, source: 'group'
  has_many :accepter_groups, through: :accepter_requests, source: 'group'
  has_many :requester_groups, through: :requester_requests, source: 'group'


  validates :uid, presence: true, uniqueness: true
  validates :user_name, presence: true





	#引数に関連するユーザーが存在すればそれを返し、存在しなければ新規に作成する
 	def self.find_or_create_from_auth_hash(auth_hash)

    uid 		       = auth_hash[:uid]
    provider       = auth_hash[:provider]
    user_name 	   = auth_hash[:info][:nickname]
    account_name   = auth_hash[:info][:name]
    image_url 	   = auth_hash[:extra][:raw_info][:profile_image_url_https]
    description    = auth_hash[:info][:description]
    banner_url     = auth_hash[:extra][:raw_info][:profile_banner_url]


    user = self.find_or_create_by(uid: uid)

   	user.user_name = user_name        unless user.user_name == user_name
    user.account_name = account_name  unless user.account_name == account_name
   	user.image_url = image_url        unless user.image_url == image_url
    user.description = description    unless user.description == description
    user.banner_url = banner_url      unless user.banner_url == banner_url
    user.provider = provider          unless user.provider == provider

    user.save

    return user
 	end

end
