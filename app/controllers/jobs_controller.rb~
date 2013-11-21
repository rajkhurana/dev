class JobsController < ApplicationController

  def index    
    @jobs = Job.all  
    @all_jobs = Job.all
    @all_users = User.all  
  end
  def new
  @job = Job.new
  end

  def create
    Job.create params[:job]
    redirect_to jobs_path, :notice => 'Job Created!'
  end

  def edit
  @job=Job.find(params[:id])
  end
  
 def destroy
   
   @job = Job.find(params[:id])
   @job.destroy
 
  redirect_to jobs_path
end
 def jobupdate
  @job = Job.find(params[:job][:id])
 
  if @job.update(params[:job])
    redirect_to jobs_path
  else
    render 'edit'
  end

 end

 def update
#iterate through all users
#find what jobs they are associated with
#set up the matches
  users = User.all
  jobs = Job.all
  
  users.each do |user|
	user.jobs.clear

	jobs.each do |job|
	  if params.has_key? 'user_' + user.id.to_s + '_job_' + job.id.to_s
	    user.jobs << job
	  end
	end
  end
	redirect_to :back, :notice => 'Jobs Updated!'
  end
end
