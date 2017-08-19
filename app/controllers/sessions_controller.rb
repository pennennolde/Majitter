class SessionsController < ApplicationController

	def create
		auth_hash = request.env['omniauth.auth']
		# request.env['omniauth.auth'] にログインしたユーザの情報（access_tokenとか）が入っている
    	user = User.find_or_create_from_auth_hash(auth_hash)
    	session[:user_id]				= user.id
    	session[:oauth_token]			= auth_hash['credentials']['token']
	    session[:oauth_token_secret]	= auth_hash['credentials']['secret']
    	redirect_to root_path, notice: 'ログインしました'
  	end

  	def destroy
		reset_session
		redirect_to root_path, notice: 'ログアウトしました'
	end

end
