Rails.application.routes.draw do
  namespace :api do
    resources :robots
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'api/robot/:id/report', to: 'api/robots#report'
end
