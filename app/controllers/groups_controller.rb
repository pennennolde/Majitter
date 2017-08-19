class GroupsController < ApplicationController

	def index
		# 所属グループ一覧を表示
	end

	def new
		# フォロワーからメンバーを選んでグループをつくる
		if logged_in?
			# @friend_first = client.friends
			# @friend_first = JSON.parse((client.friends).body)
			# @friend_first = JSON.generate(client.friends.first.to_h)
			@friend_first = client.friends.first.to_h
		end
	end

end
