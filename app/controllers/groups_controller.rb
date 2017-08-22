class GroupsController < ApplicationController

	# require 'JSON'

	def index
		# 届いている招待を表示
		@requests = current_user.requests

		# 所属グループ一覧を表示
		# @mygroups = Group.where(id: current_user.groups.ids)
		@members = current_user.members
	end

	def show
		@group = Group.find(params[:id])
		@request_for_me = @group.requests.find_by(user_id: current_user.id)
	end

	def new
		# フォロワーからメンバーを選んでグループをつくる
		if logged_in?
			# @friend_first = client.friends　← JSON形式のまんまになる
			# @friend_first = JSON.parse((client.friends).body) ← bodyがエラー
			# @friend_first = JSON.generate(client.friends.first.to_h) ← hashになるが、generateの意味がないっぽい
			
			#@friend_first = client.friends.first.to_h
			# @friend_first = JSON.load(client.friends.first) ←　エラー

			# @friend_first = JSON.parse(client.friends.first) ← エラー
			@friends = client.friends.to_h
			# @friends = JSON.load(client.friends) ← エラー、なんかおしい


			# フォロワー情報を取ってきて、Majitterユーザーだけ表示する(グループメンバー候補)

			@group = Group.new
		end
	end

	def create
		# グループの新規作成
		# group = Group.create(group_params)
		# Requestのcreateは勝手にやってくれる、なぜかMemberはやらない
		group = Group.new(group_params)
		group.requests.each do |r|
			r[:requester_id] = current_user.id
		end
		t_or_f = group.save

		member = Member.new(group_id: group.id, user_id: current_user.id)

		if t_or_f && member.save
			redirect_to groups_path
		else
			redirect_to new_group_path, notice: 'グループの作成に失敗しました'
		end
	end


	private

	def group_params
		params.require(:group).permit(:group_name, {:user_ids => []} )
	end

end
