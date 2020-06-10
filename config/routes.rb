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
    resources :users, except: %i(new create)
    get "activation/:token", to: "auths#edit", as: "activation"
    resources :password_resets, except: %i(index show destroy)
  end
end
