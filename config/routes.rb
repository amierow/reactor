Rails.application.routes.draw do
  devise_for :leads
  # Routes for the Lead resource:
  # READ
  get "/leads", :controller => "leads", :action => "index"
  get "/leads/:id", :controller => "leads", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
