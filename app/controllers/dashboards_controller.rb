class DashboardsController < ApplicationController
  def index
    
  end
  def man_emp_cmp
  render layout: 'manage'
  end
  def not_done
  
  end
  def payroll
  render layout: 'payroll'
  end
end
