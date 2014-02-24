Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :citybox_orders
  end
end
