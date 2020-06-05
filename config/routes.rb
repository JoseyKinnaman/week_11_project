Rails.application.routes.draw do
  root to: 'products#home'
  devise_for :users
  root to: 'products#home'
  get 'home' => 'products#home'
  resources :products do
    resources :reviews
  end
end
