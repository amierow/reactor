Rails.application.routes.draw do
  # Routes for the Rating resource:
  # CREATE
  get "/ratings/new", :controller => "ratings", :action => "new"
  post "/create_rating", :controller => "ratings", :action => "create"

  # READ
  get "/ratings", :controller => "ratings", :action => "index"
  get "/ratings/:id", :controller => "ratings", :action => "show"

  # UPDATE
  get "/ratings/:id/edit", :controller => "ratings", :action => "edit"
  post "/update_rating/:id", :controller => "ratings", :action => "update"

  # DELETE
  get "/delete_rating/:id", :controller => "ratings", :action => "destroy"
  #------------------------------

  # Routes for the Insight resource:
  # CREATE
  get "/insights/new", :controller => "insights", :action => "new"
  post "/create_insight", :controller => "insights", :action => "create"

  # READ
  get "/insights", :controller => "insights", :action => "index"
  get "/insights/:id", :controller => "insights", :action => "show"

  # UPDATE
  get "/insights/:id/edit", :controller => "insights", :action => "edit"
  post "/update_insight/:id", :controller => "insights", :action => "update"

  # DELETE
  get "/delete_insight/:id", :controller => "insights", :action => "destroy"
  #------------------------------

  # Routes for the Contributor resource:
  # CREATE
  get "/contributors/new", :controller => "contributors", :action => "new"
  post "/create_contributor", :controller => "contributors", :action => "create"

  # READ
  get "/contributors", :controller => "contributors", :action => "index"
  get "/contributors/:id", :controller => "contributors", :action => "show"

  # UPDATE
  get "/contributors/:id/edit", :controller => "contributors", :action => "edit"
  post "/update_contributor/:id", :controller => "contributors", :action => "update"

  # DELETE
  get "/delete_contributor/:id", :controller => "contributors", :action => "destroy"
  #------------------------------

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
