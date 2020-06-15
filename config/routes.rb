Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "simple_pages#home"

    get "home", to: "simple_pages#home", as: "home"
    get "help", to: "simple_pages#help", as: "help"
    get "signup", to: "users#new"
    post "signup", to: "users#create"
    get "login", to: "auths#new"
    post "login", to: "auths#create"
    delete "logout", to: "auths#destroy"
    get "activation/:token", to: "auths#edit", as: "activation"
    get ":id/following", to: "following#index", as: "following"
    get ":id/followers", to: "followers#index", as: "followers"
    resources :password_resets, except: %i(index show destroy)
    resources :users, except: %i(new create)
    resources :micro_posts, only: %i(create destroy)
    resources :relationships, only: %i(create destroy)
  end
end
