Rails.application.routes.draw do

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
          omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  
  resources :widgets

  root 'welcome#index'

end
