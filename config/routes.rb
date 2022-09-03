Rails.application.routes.draw do
   scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get :confirm
        get :complete
      end
    end

    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'cart_items/destroy_all', as: 'cart_items_destroy_all'

    resource :customers, only: [:edit, :update] do
      collection do
        get :confirm
        patch :withdrawal
      end
    end
    get 'customers/mypage' => 'customers#show', as: 'customer'

    resources :items, only: [:index, :show]

    root 'homes#top'
    get 'homes/about', as: 'about'

  end


  namespace :admin do
    resources :orders, only: [:show, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :order_details, only: [:update]

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
