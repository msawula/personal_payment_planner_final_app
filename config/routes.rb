Rails.application.routes.draw do
  # Routes for the Bill resource:
  # CREATE
  get "/bills/new", :controller => "bills", :action => "new"
  post "/create_bill", :controller => "bills", :action => "create"

  # READ
  get "/bills", :controller => "bills", :action => "index"
  get "/bills/:id", :controller => "bills", :action => "show"

  # UPDATE
  get "/bills/:id/edit", :controller => "bills", :action => "edit"
  post "/update_bill/:id", :controller => "bills", :action => "update"

  # DELETE
  get "/delete_bill/:id", :controller => "bills", :action => "destroy"
  #------------------------------

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
