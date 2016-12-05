Rails.application.routes.draw do
  # Routes for the Paycheck resource:
  # CREATE
  get "/paychecks/new", :controller => "paychecks", :action => "new"
  post "/create_paycheck", :controller => "paychecks", :action => "create"

  # READ
  get "/paychecks", :controller => "paychecks", :action => "index"
  get "/paychecks/:id", :controller => "paychecks", :action => "show"

  # UPDATE
  get "/paychecks/:id/edit", :controller => "paychecks", :action => "edit"
  post "/update_paycheck/:id", :controller => "paychecks", :action => "update"

  # DELETE
  get "/delete_paycheck/:id", :controller => "paychecks", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
