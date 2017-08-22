class TweetsController < ApplicationController

	def index
		# タイムライン
		if logged_in?
			mem_g = current_user.member_groups
			@tweets = []
			mem_g.each do |g|
				g.tweets.each do |t|
					@tweets << t
				end
			end
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
		tweet[:user_id] = current_user.id
		if tweet.save
			redirect_to root_path
		else
			redirect_to new_tweet_path, notice: 'Tweetに失敗しました'
		end
	end


	private

	def tweet_params
		params.require(:tweet).permit(:text, :group_id)
	end

end
