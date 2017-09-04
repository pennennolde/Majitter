class MembersController < ApplicationController

	def edit
		# グループ参加 (グループ招待(request)を承認)
		# request = Request.find_by(group_id: params[:id], user_id: current_user.id)
		request = current_user.accepter_requests.find_by(group_id: params[:id])
		unless request==nil
			# member = Member.new(group_id: params[:id], user_id: current_user.id)
			member = current_user.members.new(group_id: params[:id])
			@group = member.group
			if member.save
				request.destroy
				# redirect_to groups_path and return, notice: 'グループに参加しました'
				flash[:success] = "グループに参加しました！"
				redirect_to group_path(@group) and return
			else
				# redirect_to groups_path, notice: 'グループへの参加に失敗しました'
				# render 'group/show'
				# flash[:warning] = "グループ参加に失敗しました"
				# redirect_to group_path(@group)
				redirect_to request.referrer || root_url, flash: { error: member.errors.full_messages }
			end
		else
			flash[:danger] = "アクセスが許可されていないページです"
			redirect_to root_path
		end
	end

end
