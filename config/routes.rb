Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "cash_machines/search", to: "cash_machines#search" 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
