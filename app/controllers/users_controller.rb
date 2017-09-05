class UsersController < ApplicationController

	def show
		user = User.find_by(id: params[:id])
		if user==current_user
			@user = current_user
			@tweets = current_user.tweets.includes([:group, :user]).page(params[:page]).per(20)
		end
	end

	def destroy
		user = User.find_by(id: params[:id])
		if user==current_user
			if user.destroy
				reset_session
				flash[:success] = 'Majitterを退会しました。Majitterのデータベースからあなたのユーザー情報やMajitterでのtweetは削除されました。アプリ連携を解除するには、Twitterの 設定/アプリ連携 ページにて手続きしてください。'
				redirect_to root_path and return
			else
				redirect_to request.referrer || root_url, flash: { error: user.errors.full_messages }
			end
		else
			flash[:danger] = "アクセスが許可されていないページです"
			redirect_to root_path
		end
	end

end
