Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { sessions: 'users/sessions', passwords: 'users/forgot_password', registrations: 'users/registrations', confirmations: 'users/confirmations' },
    paths: { passwords: 'forgot_password' }
  # Defines the root path route ("/")
  root 'home#index'
  get '/en', to: 'home#index'
  get '/vi', to: 'home#index'
  get 'tin-tuc', to: 'highlight_posts#index'
  get 'tuyen-sinh', to: 'highlight_posts#index'
  resources :posts
  resources :research
  resources :students
  resources :highlight_posts
  resources :academic
  resources :cooperation
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

    resources :posts, except: :edit
    resources :our_team, except: :edit
    resources :our_partner, except: :edit
    resources :news, except: :edit
    resources :page_info, except: :edit
    resources :banners
  end
end
