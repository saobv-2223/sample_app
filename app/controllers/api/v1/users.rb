class API::V1::Users < Grape::API
  include API::V1::Defaults

  prefix "api"
  version "v1", using: :path
  format :json

  before do
    authenticate_user!
  end

  resources :users do
    desc "Return all users"
    get "/", root: :users do
      users = User.all
      present users, with: API::Entities::User
    end

    desc "Get user's profile"
    params do
      requires :id, type: String, desc: "ID of user"
    end
    get ":id", root: :users do
      user = User.find params[:id]
      present user, with: API::Entities::User
    end
  end
end
