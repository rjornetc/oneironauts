Rails.application.routes.draw do

  get 'board_messages/index'

  get 'board_messages/create'

  get 'board_messages/update'

  get 'board_messages/new'

  get 'board_messages/edit'

  get 'board_messages/delete'

  get 'board_messages/destroy'

  get 'board_messages/show'

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

  resources :sleep_logs

  resources :dreams do
      member do
          get 'vote_up'
          get 'vote_down'
          get 'set_scope'
      end
  end

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
  } 
  devise_scope :user do
      get 'user/:id/profile' => 'users/registrations#show', as: 'user_profile'
      get 'user/:id/delete_avatar' => 'users/registrations#delete_avatar', as: 'delete_avatar'
    end
  
  resources :widgets

  root 'welcome#index'

end
