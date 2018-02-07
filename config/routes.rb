Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, only: [] do
    collection do
      get 'customer_category_purchases'
    end
  end

  resources :products, only: [] do
    collection do
      get 'sold_by_date_range'
    end
  end
end
