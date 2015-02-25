Rails.application.routes.draw do

  get 'post_categories/index'

  get 'post_categories/new'

  get 'post_categories/create'

  get 'post_categories/edit'

  get 'post_categories/update'

  get 'post_categories/delete'

  get 'post_categories/destroy'

  get 'categories/index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/delete'

  get 'categories/destroy'

  get 'comments/index'

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/delete'

  get 'comments/destroy'

  get 'comments/vote_up'

  get 'comments/vote_down'

  get 'comments/mark_as_spam'

  get 'posts/index'

  get 'posts/new'

  get 'posts/create'

  get 'posts/edit'

  get 'posts/update'

  get 'posts/delete'

  get 'posts/destroy'

  get 'posts/vote_up'

  get 'posts/vote_down'

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
