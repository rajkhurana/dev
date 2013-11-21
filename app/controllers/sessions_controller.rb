class SessionsController < ApplicationController
skip_before_filter :check_user_login , :only => [:new,:create]
before_filter :clear_all_history, :only =>[:destroy]

 

  def new
    if session[:user_id]
     redirect_to dashboard_path, :notice => "Already logged in!"
    else
    render layout: "welcome"    
    end
  end

  def create
	user = User.authenticate(params[:session][:email], params[:session][:password])
	if user
		session[:user_id] = user.id
                flash[:success] = "Logged in!"
		redirect_to dashboard_path
	else
		flash.now.alert = "Invalid email or password"
		render "new"
	end
  end
  

  def destroy
    session[:user_id] = nil
    expires_now()   
    redirect_to root_path, :notice => "Logged out!"
  end
  
  private
  
  def clear_all_history 
  response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"  
  end

end
