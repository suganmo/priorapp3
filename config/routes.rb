Rails.application.routes.draw do
  get 'users/dash_bords'
  #resources :articles,  path: '/users/articles'
  namespace :users do
    resources :articles
  end
  
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
