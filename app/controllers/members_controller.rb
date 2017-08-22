class MembersController < ApplicationController

	def edit
		# グループ参加 (グループ招待(request)を承認)
		member = Member.new(group_id: params[:id], user_id: current_user.id)
		request = Request.find_by(group_id: params[:id], user_id: current_user.id)
		if member.save
			request.destroy
			redirect_to groups_path, notice: 'グループに参加しました'
		else
			redirect_to groups_path, notice: 'グループの参加に失敗しました'
		end
	end

end
