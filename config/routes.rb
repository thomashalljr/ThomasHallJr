Rails.application.routes.draw do
  root to: 'pages#index'
  get "pages/portfolio", to: "pages#portfolio"
end
