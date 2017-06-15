Rails.application.routes.draw do


  resources :house_holds do
    resources :services
    resources :expenses
  end
  resources :users do
    resources :expenses
  end

  devise_for :users, path_prefix: 'devise', controllers: {
      registrations: 'users/registrations'
  }



  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
