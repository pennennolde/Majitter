class GroupsController < ApplicationController

	# require 'JSON'

	def index
		# 所属グループ一覧を表示
		@mygroups = Group.where(id: current_user.groups.ids)
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
		group = Group.create(group_params)
		# Memberのcreateは勝手にやってくれる
		redirect_to groups_path
	end


	private

	def group_params
		params.require(:group).permit(:group_name, { :user_ids => [] })
	end

end
