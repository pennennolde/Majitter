class TweetsController < ApplicationController

	skip_before_action :require_login, only: [:index]

	def index
		# タイムライン
		if logged_in?
			my_g_ids = current_user.member_groups.ids
			@tweets = Tweet.where(group_id: my_g_ids).order(created_at: :desc).includes([:group, :user])

			# @tweets = current_user.member_groups.tweets.includes([:group, :user]) # ← エラー、ダメ
		end
	end

	def new
		# つぶやき入力
		@tweet = Tweet.new
		@groups = current_user.member_groups
	end

	def create
		# つぶやき送信
		# tweet = Tweet.new({user_id: current_user.id}, tweet_params)
		tweet = Tweet.new(tweet_params)
		if tweet.save
			redirect_to root_path
		else
			redirect_to new_tweet_path, notice: 'Tweetに失敗しました'
		end
	end


	private

	def tweet_params
		params.require(:tweet).permit(:text, :group_id).merge(user_id: current_user.id)
	end

end
