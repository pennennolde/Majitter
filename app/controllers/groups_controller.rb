class GroupsController < ApplicationController

	# require 'JSON'

	def index
		# 届いている招待を表示
		# @requests = current_user.accepter_requests.includes([:group, :requester])
		# 所属グループ一覧を表示
		@groups = current_user.member_groups.page(params[:page]).per(20)
	end

	def show
		@group = Group.includes([:member_users, :tweets]).find_by(id: params[:id])
		if @group.member_users.include?(current_user)
			@i_am_member = true
			@tweets = @group.tweets.includes([:user]).page(params[:page]).per(20)
		elsif @group.accepters.include?(current_user)
			@request_for_me = true
		else
			flash[:danger] = 'アクセスが許可されていないページです'
			redirect_to root_path
		end
	end

	def new
		# フォロワーからメンバーを選んでグループをつくる
		# @friend_first = client.friends　← JSON形式のまんまになる
		# @friend_first = JSON.parse((client.friends).body) ← bodyがエラー
		# @friend_first = JSON.generate(client.friends.first.to_h) ← hashになるが、generateの意味がないっぽい
		# @friend_first = JSON.load(client.friends.first) ←　エラー
		# @friend_first = JSON.parse(client.friends.first) ← エラー
		# @friends = JSON.load(client.friends) ← エラー、なんかおしい

		# @friends = client.friends.to_h
		# @friend = @friends[:users]

		# フォロワー情報を取ってきて、Majitterユーザーだけ表示する(グループメンバー候補)


		# 本番用
		# フォロワー5000人以下だけ対応
		# フォロワーが5000人以上いる場合は、得られたcursorを指定して再度取得しにいかなくてはならない
		follower_ids_hash = client.follower_ids(stringify_ids: true).to_h
		follower_ids = follower_ids_hash[:ids]

		@maji_followers = []

		follower_ids.each do |i|
			user = User.find_by(uid: i)
			@maji_followers << user unless user==nil
		end

		@group = Group.new
	end

	def create
		# グループの新規作成
		@group = Group.new(group_params)
		@group.requests.each do |r|
			r[:requester_id] = current_user.id
		end
		gsaved = @group.save
		member = Member.new(group_id: @group.id, user_id: current_user.id)
		if gsaved && member.save
			flash[:success] = "グループを作成しました！"
			redirect_to @group
		else
			# render 'new'
			redirect_to new_group_path, flash: { error: @group.errors.full_messages }
		end
	end


	private

		def group_params
			params.require(:group).permit(:group_name, {:accepter_ids => []} )
		end

end
