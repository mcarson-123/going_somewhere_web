Rails.application.routes.draw do

  resources :trips, except: [:edit, :update]
  resources :lists, except: [:index, :edit, :update]
  resources :list_items, only: [:create, :destroy]

end
