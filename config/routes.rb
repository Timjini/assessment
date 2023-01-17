Rails.application.routes.draw do
  resources :visuals do
    resources :comments
  end
  root 'home#index'
  devise_for :users

end
