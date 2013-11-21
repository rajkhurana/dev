class EmployeesController < ApplicationController
skip_before_filter :check_user_login , :only => [:new,:create] 
layout 'manage'
  def new
    @employee=Employee.new
  end
  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      @employee=Employee.find(@user.cust_id)
    end
  end
 
  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
      @employee=Employee.find(@user.cust_id)
    else 
      redirect_to root_url, :notice => "Please login!"
    end
  end

  def update
    @employee = Employee.find(params[:id]) 
    if @employee.update(params[:employee])
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      @user=User.new(email: params[:employee][:email], password: params[:employee][:password],cust_id: @employee[:id].to_s, user_type: 		'employee')
      @user.save   
      session[:user_id] = @user.id
      flash[:notice] = "Welcome! Your account has been created"
      redirect_to dashboard_path
    else
      render "new"
    end
  end
end
