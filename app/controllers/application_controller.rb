class ApplicationController < ActionController::Base

  require 'twitter'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?
  # view でも使えるようになる


  before_action :require_login



  private

    def current_user
      return unless session[:user_id]
      # @current_user ||= User.find_by(session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
      # @current_user==@current_user でなければ @current_user=User.find_by(session[:user_id]) とする
      # find() にすると見つからなかった場合errorになるが、find_by にするとnilで返ってくる
    end

    def logged_in?
      !!session[:user_id]
      # nil の場合、false を返す
    end

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.secrets.twitter_api_key#ENV["TWITTER_API_KEY"]
        config.consumer_secret     = ENV["TWITTER_API_SECRET"]
        config.access_token        = session[:oauth_token]
        config.access_token_secret = session[:oauth_token_secret]
      end
    end

    def require_login
      unless logged_in?
        flash[:danger] = "ログインしてください！"
        redirect_to root_path
      end 
    end

end
