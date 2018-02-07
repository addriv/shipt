Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, defaults: { format: :json }, only: [] do
    collection do
      get 'customer_category_purchases'
    end
  end

  resources :products, defaults: { format: :json }, only: [] do
    collection do
      get 'sold_by_date_range'
    end
  end

  resources :customers, defaults: { format: :json }, only: [:show]
end
