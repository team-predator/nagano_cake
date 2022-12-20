Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root :to => "public/homes#top"
  get '/admin' => 'admin/homes#top', as: 'admin'
  get '/about' => 'public/homes#about', as: 'about'
  
  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]

    
  end


  scope module: :public do

    resources :addresses, except: [:new, :show]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/complete'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all'
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :items, only: [:index, :show]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
