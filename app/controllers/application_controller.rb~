class ApplicationController < ActionController::Base
  
  protect_from_forgery
  helper_method :current_user
  before_filter :no_browser_cache, :check_user_login
 
  private

  def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]

  end
  
  
  def no_browser_cache
  response.headers["Last-Modified"] = Time.now.httpdate
  # response.headers["Expires"] = 0 -> this line kills heroku deployments
  # HTTP 1.0
  response.headers["Pragma"] = "no-cache"
  # HTTP 1.1 'pre-check=0, post-check=0' (IE specific)
  response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
  end
  
  def check_user_login
  if !current_user
  redirect_to root_url, :notice => "Please login!"
  end
  end

end
