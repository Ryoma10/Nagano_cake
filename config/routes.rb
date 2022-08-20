Rails.application.routes.draw do
  namespace :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end
  namespace :public do
    resources :orders, only: [:new, :complete, :create, :index, :show]
    get 'orders/confirm', as: 'orders_confirm'
  end
  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'cart_items/destroy_all', as: 'cart_items_destroy_all'
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :update, :destroy]
    get 'customers/confirm', as: 'customers_confirm'
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end

  namespace :public do
    root 'homes#top'
    get 'homes/about', as: 'about'
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    root 'homes#top'
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
