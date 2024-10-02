Rails.application.routes.draw do
  resources :products
  devise_for :users
  root "products#index"

  get "carts/:id", to: "carts#show", as: "carts"

  post "line_items_buy_now/:product_id", to: "line_items#buy_now", as: "line_item_buy_now"
  post "line_items_add_to_cart/:product_id", to: "line_items#add_to_cart", as: "line_item_add_to_cart"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
