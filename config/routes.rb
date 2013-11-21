Dev::Application.routes.draw do
	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	
        get "edit_employee"  => "employees#edit"
        get "show_employee"  =>"employees#show"
        get "edit_company"  => "companies#edit"
        get "show_company"  =>"companies#show"
        patch "jobupdate_job"      =>"jobs#jobupdate"
        

	get "generatepayroll" => "payrolls#index", :as => "payroll"
	post "new_payroll" => "payrolls#setup", :as => "payroll_setup"
	post "create_payroll" => "payrolls#create", :as => "create_payroll"
       
  	get "new_employee" =>"employees#new"
  	get "new_company"  =>"companies#new"
       
	#get "job" => "jobs#index", :as => "job"
	post "update_jobs" => "jobs#update", :as => "update_jobs"
  	get "dashboard" =>"dashboards#index"
        get   "manage"  => "dashboards#man_emp_cmp"
        get   "notDone"  => "dashboards#not_done"
        get  "payroll"   => "dashboards#payroll"

	root :to => "sessions#new"
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	resources :payrolls
	resources :jobs
  	resources :employees
  	resources :companies
  	resources :dashboards
end
