Rails.application.routes.draw do

  namespace :api do
    resources :books, only: [:index, :show]
    resources :list_items, only: [:index, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
