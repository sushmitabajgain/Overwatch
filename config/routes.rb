Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end

  devise_for :users, controllers: { sessions: 'users/sessions'}

  devise_scope :user do
    post 'login', to: 'users/sessions#create'
  end
  
  root to: 'application#index'
end