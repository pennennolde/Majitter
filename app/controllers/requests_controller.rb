class RequestsController < ApplicationController

	def destroy
		# グループ参加拒否 (グループ招待(request)を拒否)
		request = Request.find_by(group_id: params[:id], user_id: current_user.id)
		request.destroy
		redirect_to groups_path, notice: 'グループ招待を拒否しました'
	end

end
