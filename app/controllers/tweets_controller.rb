class TweetsController < ApplicationController

	skip_before_action :require_login, only: [:index]

	def index
		# タイムライン
		if logged_in?

			# これでは、my_g_idsをrailsのメモリに展開する分遅くなる
			# my_g_ids = current_user.member_groups.ids
			# @tweets = Tweet.where(group_id: my_g_ids).includes([:group, :user])
			# → サブセレクト（サブクエリ）を用いて、DB上だけで完結させて早くする
    		my_g_ids = "SELECT group_id FROM members WHERE user_id = :user_id"
    		@tweets = Tweet.where("group_id IN (#{my_g_ids})", user_id: current_user.id).includes([:group, :user])

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
		# tweet = Tweet.new(tweet_params)
		tweet = current_user.tweets.new(tweet_params)		
		# tweet.save
		if tweet.save
			my_g_ids = current_user.member_groups.ids
			@tweets = Tweet.where(group_id: my_g_ids).order(created_at: :desc).includes([:group, :user])
		else
			# render '_modal'
			# redirect_to tweets_path, flash: { error: tweet.errors.full_messages }
			redirect_to request.referrer || root_url, flash: { error: tweet.errors.full_messages }

		end
	end


	private

		def tweet_params
			# params.require(:tweet).permit(:text, :group_id).merge(user_id: current_user.id)
			params.require(:tweet).permit(:text, :group_id)
		end

end
