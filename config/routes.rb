Rails.application.routes.draw do
  # Routes for the Presentation resource:
  # CREATE
  get "/presentations/new", :controller => "presentations", :action => "new"
  post "/create_presentation", :controller => "presentations", :action => "create"

  # READ
  get "/presentations", :controller => "presentations", :action => "index"
  get "/presentations/:id", :controller => "presentations", :action => "show"

  # UPDATE
  get "/presentations/:id/edit", :controller => "presentations", :action => "edit"
  post "/update_presentation/:id", :controller => "presentations", :action => "update"

  # DELETE
  get "/delete_presentation/:id", :controller => "presentations", :action => "destroy"
  #------------------------------

  devise_for :leads
  # Routes for the Lead resource:
  # READ
  get "/leads", :controller => "leads", :action => "index"
  get "/leads/:id", :controller => "leads", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
