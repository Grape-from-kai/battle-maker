Rails.application.routes.draw do
  root to: 'battles#index'
  devise_for :users
  resources :users,only:[:show]
  
  
  resources :battles do
    resources :comments
  end
    
  resources :participant_managements, only:[:index, :create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
