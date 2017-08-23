class RequestsController < ApplicationController

	def destroy
		# グループ参加拒否 (グループ招待(request)を拒否)
		request = Request.find_by(group_id: params[:id], user_id: current_user.id)
		unless request==nil
			request.destroy
			redirect_to groups_path and return, notice: 'グループ招待を拒否しました'
		else
			redirect_to root_path, notice: 'アクセスが許可されていないページです'
		end
	end

end
