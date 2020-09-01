Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end
  devise_for :users, skip: :sessions, controllers: {
   confirmations: 'users/confirmations'}

  devise_scope :user do
    post 'login', to: 'users/sessions#create'
  end
  
  root to: 'application#index'
end