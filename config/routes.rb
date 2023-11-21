Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { sessions: 'users/sessions', passwords: 'users/forgot_password', registrations: 'users/registrations', confirmations: 'users/confirmations' },
    paths: { passwords: 'forgot_password' }
  # Defines the root path route ("/")
  root 'home#index'
  get '/en', to: 'home#index'
  get '/vi', to: 'home#index'
  resources :tours
  resources :package_tours
  resources :tour_nuoc_ngoai
  resources :vietnam_north
  resources :vietnam_central
  resources :vietnam_south
  resources :thailan
  resources :lao
  resources :cam
  resources :sing
  resources :malai
  resources :indo
  resources :grand_vietnam
  resources :highlight_tours
  resources :news
  resources :car_rental
  resources :our_guest
  resources :contact_us
  resources :about_us
  resources :quote
  resources :our_team
  resources :our_partner
  mount Ckeditor::Engine => '/ckeditor'
  namespace :users do
    resource :avatar, only: :update
    get :profile, to: 'profile#index'
    put :profile, to: 'profile#update'

    resources :tours, except: :edit
    resources :our_guest, except: :edit
    resources :our_team, except: :edit
    resources :our_partner, except: :edit
    resources :news, except: :edit
    resources :car_rental, except: :edit
    resources :page_info, except: :edit
  end
end
