Rails.application.routes.draw do

  get 'sleep_guide' => 'sleep_guide#index'

  resources :board_messages

  resources :voters

  resources :post_categories

  resources :categories

  resources :comments

  resources :posts do
      resources :comments, shallow: true
  end

  resources :group_users
  
  resources :groups
  
  resources :friendships  

  resources :logs

  resources :meanings do
      member do
          get 'mark_as_spam'
          get 'vote_up'
          get 'vote_down'
      end
  end

  resources :dream_signs
  

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations',
          omniauth_callbacks: 'users/omniauth_callbacks'
  }, :path => "users"
  devise_scope :user do
      
      get 'user/:id/profile' => 'users/registrations#show', as: 'user_profile'
      get 'user/:id/delete_avatar' => 'users/registrations#delete_avatar', as: 'delete_avatar'
    end
  resources :users do
      resources :sleep_logs
      resources :dreams 
      resources :characters
  end
  resources :widgets

  root 'welcome#index'

end
