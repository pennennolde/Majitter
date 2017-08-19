class TweetsController < ApplicationController

	require 'twitter'

	def index
		if logged_in?
			#make_client
			@friend_first = make_client.friends.first
		end
	end


	private

	def make_client
  		Twitter::REST::Client.new do |config|
			config.consumer_key        = Rails.application.secrets.twitter_api_key#ENV["TWITTER_API_KEY"]
			config.consumer_secret     = ENV["TWITTER_API_SECRET"]
			config.access_token        = session[:oauth_token]
			config.access_token_secret = session[:oauth_token_secret]
		end
 	end

end
