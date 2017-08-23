class MembersController < ApplicationController

	def edit
		# グループ参加 (グループ招待(request)を承認)
		request = Request.find_by(group_id: params[:id], user_id: current_user.id)
		unless request==nil
			member = Member.new(group_id: params[:id], user_id: current_user.id)
			if member.save
				request.destroy
				redirect_to groups_path and return, notice: 'グループに参加しました'
			else
				redirect_to groups_path, notice: 'グループへの参加に失敗しました'
			end
		else
			redirect_to root_path, notice: 'アクセスが許可されていないページです'
		end
	end

end
