class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?
  # view でも使えるようになる

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(session[:user_id])
    # @current_user==@current_user でなければ @current_user=User.find_by(session[:user_id]) とする
    # find() にすると見つからなかった場合errorになるが、find_by にするとnilで返ってくる
  end

  def logged_in?
    !!session[:user_id]
    # nil の場合、false を返す
  end

end
