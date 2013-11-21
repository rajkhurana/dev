Dev::Application.routes.draw do
	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"

	get "payroll" => "payrolls#index", :as => "payroll"
	post "new_payroll" => "payrolls#setup", :as => "payroll_setup"
	post "create_payroll" => "payrolls#create", :as => "create_payroll"

	get "job" => "jobs#index", :as => "job"
	post "update_jobs" => "jobs#update", :as => "update_jobs"

	root :to => "users#new"
	resources :users
	resources :sessions
	resources :payrolls
	resources :jobs
end
