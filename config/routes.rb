Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'battles#top'
  devise_for :users
  resources :users, only:[:show]
  
  
  resources :battles do
    collection do
      get 'top'
    end
    resources :comments
  end
    
  resources :participant_managements, only:[:index, :create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
