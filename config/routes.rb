Rails.application.routes.draw do
  devise_for :users
  resources :products
  root "products#index"

  get "/carts/:id", to: "carts#show", as: "carts"

  post "line_items_buy_now/:product_id", to: "line_items#buy_now", as: "line_item_buy_now"
  post "line_items_add_to_cart/:product_id", to: "line_items#add_to_cart", as: "line_item_add_to_cart"
  delete "line_items_delete_from_cart/:product_id", to: "line_items#destroy_from_cart", as: "destroy_from_cart"
  post "line_items_add_quantity/:product_id", to: "line_items#add_quantity", as: "line_item_add_quantity"
  post "line_items_subtract_quantity/:product_id", to: "line_items#subtract_quantity", as: "line_item_subtract_quantity"

  get "customer_address", to: "customers#customer_address", as: "customer_address"
  post "customer_address_update", to: "customers#customer_address_update", as: "customer_address_update"

  post "/order", to: "orders#order", as: "order"
  get "/success", to: "orders#success", as: "success"
  get "/orders", to: "orders#index", as: "orders"
  get "/order/:order_id", to: "orders#show", as: "order_show"
  post "/delivered/:order_id", to: "orders#mark_delivered", as: "mark_delivered"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
