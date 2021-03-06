Rails.application.routes.draw do
  root to: "pages#index"
  get "portfolio", to: "pages#portfolio"
  get "resume", to: redirect("https://drive.google.com/open?id=1JP8k619YpRHOSWOhgH5nq1-8cE2iq4IOuZ1VOOdPUZ0")
  resources :articles
  get "blog", to: "articles#index"
  get "signup", to: "users#new"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
