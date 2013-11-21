class CompaniesController < ApplicationController
skip_before_filter :check_user_login , :only => [:new,:create]
layout 'manage'
  def new
    @company=Company.new
  end
   def create
    @company = Company.new(params[:company])
    if  !User.find_by_email(params[:company][:email]) and @company.save
      @user=User.new(email: params[:company][:email], password: params[:company][:password],cust_id: @company[:id].to_s, user_type: 'company')
      @user.save    
    
      session[:user_id] = @user.id
      redirect_to dashboard_path, :notice => "Signed in!"
     
    else
      render "new"
    end
  end
  
  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.user_type=="company"      
      @company=Company.find(@user.cust_id)
      else
      redirect_to dashboard_path, :notice => "Please login with company account!"
      end
     else 
      redirect_to root_url, :notice => "Please login!"
    end
  end
 
  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.user_type=="company" 
       @company=Company.find(@user.cust_id)
       else
      redirect_to dashboard_path, :notice => "Please login with company account!"
      end
    else 
      redirect_to root_url, :notice => "Please login!"
    end
  end
  
  def update
    @company = Company.find(params[:id]) 
    if @company.update(params[:company])
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
end
