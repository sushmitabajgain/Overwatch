Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :roles
      resources :weeks do
        resources :projects
        resources :resources
        resources :milestones
      end
      get 'projects', :to => 'projects#projects'
      get 'resources', :to => 'resources#resources'
      get 'milestones', :to => 'milestones#milestones'
      get 'search', :to=> 'search#index'
      get 'worksheet', :to=> 'projects#worksheet'
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