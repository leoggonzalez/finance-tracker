Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  get 'my_porfolio', to: 'users#my_porfolio'
  get 'search_stock', to: 'stocks#search'
end
