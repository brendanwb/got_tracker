Rails.application.routes.draw do
  resources :episodes
  resources :shows
  root to: "shows#index"
end
