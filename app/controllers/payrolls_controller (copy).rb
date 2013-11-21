class PayrollsController < ApplicationController
layout  'payroll'
  def index
    @users = User.all
    @payrolls = Payroll.all
    @payroll = Payroll.new
  end

  def setup
    checked_users = ''

    #calculate first and last day of pay
    #first day is last day minus pay period

    @last_day_of_pay = Date.new(params['endday']['endday(1i)'].to_i,
      params['endday']['endday(2i)'].to_i,
      params['endday']['endday(3i)'].to_i )
    @first_day_of_pay = nil
    case params['Pay Period'].to_i
    when 1 #Weekly
      @first_day_of_pay = @last_day_of_pay - 7

    when 2 #Biweekly
      @first_day_of_pay = @last_day_of_pay - 14

    when 3 #Monthly
      @first_day_of_pay = @last_day_of_pay << 1

    when 4 #Bimonthly
      @first_day_of_pay = @last_day_of_pay << 2
    end

    @current_payrolls = {} #hash for all the payrolls currently being created
    current_employee_list=[]
    #create a payroll record for each user where the checkbox was selected
    User.all.each do |user|
      if params['checkbox_' + user.id.to_s]['selected'] == '1'
        current_employee_list << user.id.to_s
        @current_payrolls[user.id.to_s] = {}
        user.jobs.each do |job|
          new_payroll = Payroll.new          
          new_payroll.user = user
          new_payroll.job = job

          @current_payrolls[user.id.to_s][job.id.to_s] = new_payroll
        end
      end
    end

    session[:current_employee_list] = current_employee_list
    
  end


  def create
    #use the payrolls from the session variable
    #add the extra data
    #save in the db  

    notice = 'Payrolls Created!'
    session[:current_employee_list].each do |user|
      @user=User.find(user)
      @user_jobs= @user.jobs.all
      @user_jobs.each do |job| 
        hours_worked = params['payroll_' + @user.id.to_s +  '_job_' + job.id.to_s]['hours_worked'].to_f
        deductions = params['payroll_' + @user.id.to_s + '_job_' + job.id.to_s]['deductions'].to_f

        if job.issalaried
          grosspay = job.payrate
        else
          grosspay = job.payrate * hours_worked
        end
        payroll_to_save = Payroll.new
        payroll_to_save.hoursworked = hours_worked
        payroll_to_save.deductions = deductions
        payroll_to_save.grosspay = grosspay
        payroll_to_save.netpay = grosspay - deductions
        payroll_to_save.startday = params['start_date']
        payroll_to_save.endday = params['end_date']    
        payroll_to_save.user_id = @user.id.to_s
        payroll_to_save.job_id = job.id.to_s
        payroll_to_save.save
      end  
    end
    session.delete(:current_employee_list)
  redirect_to payroll_path, :notice => notice
  end
end
