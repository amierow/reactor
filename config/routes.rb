Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "presentations#index"
  # Routes for the Insight_type resource:
  # CREATE
  get "/insight_types/new", :controller => "insight_types", :action => "new"
  post "/create_insight_type", :controller => "insight_types", :action => "create"

  # READ
  get "/insight_types", :controller => "insight_types", :action => "index"
  get "/insight_types/:id", :controller => "insight_types", :action => "show"

  # UPDATE
  get "/insight_types/:id/edit", :controller => "insight_types", :action => "edit"
  post "/update_insight_type/:id", :controller => "insight_types", :action => "update"

  # DELETE
  get "/delete_insight_type/:id", :controller => "insight_types", :action => "destroy"
  #------------------------------

  # Routes for the Rating_type resource:
  # CREATE
  get "/rating_types/new", :controller => "rating_types", :action => "new"
  post "/create_rating_type", :controller => "rating_types", :action => "create"

  # READ
  get "/rating_types", :controller => "rating_types", :action => "index"
  get "/rating_types/:id", :controller => "rating_types", :action => "show"

  # UPDATE
  get "/rating_types/:id/edit", :controller => "rating_types", :action => "edit"
  post "/update_rating_type/:id", :controller => "rating_types", :action => "update"

  # DELETE
  get "/delete_rating_type/:id", :controller => "rating_types", :action => "destroy"
  #------------------------------

  # Routes for the Vote resource:
  # CREATE
  get "/votes/new", :controller => "votes", :action => "new"
  post "/create_vote", :controller => "votes", :action => "create"

  # READ
  get "/votes", :controller => "votes", :action => "index"
  get "/votes/:id", :controller => "votes", :action => "show"

  # UPDATE
  get "/votes/:id/edit", :controller => "votes", :action => "edit"
  post "/update_vote/:id", :controller => "votes", :action => "update"

  # DELETE
  get "/delete_vote/:id", :controller => "votes", :action => "destroy"
  #------------------------------

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
