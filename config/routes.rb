Rails.application.routes.draw do
  get 'home/index'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'
end
