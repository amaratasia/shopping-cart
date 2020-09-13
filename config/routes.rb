Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index]
  resources :cart, only: [] do
      collection do
        post :add_to_cart
        get :items
      end
  end
end

