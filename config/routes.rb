Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :roles
      get 'worksheets', :to => 'projects#worksheet'
      get 'projects', :to => 'projects#index'
      get 'status_count', :to => 'projects#getStatusCount'
      get 'resources', :to => 'resources#resources'
      get 'search', :to=> 'search#index'
    end
  end

  devise_for :users, skip: :sessions, controllers: {passwords: 'users/passwords',
  confirmations: 'users/confirmations'}

  devise_for :users, controllers: { sessions: 'users/sessions'}

  devise_scope :user do
    post 'login', to: 'users/sessions#create'
  end
  
  root to: 'application#index'
end