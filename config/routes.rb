Rails.application.routes.draw do



  resources :services
  resources :house_holds
  resources :expenses
  devise_for :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
