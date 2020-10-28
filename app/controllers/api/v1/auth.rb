module API
  module V1
    class Auth < Grape::API
      include API::V1::Defaults

      helpers do
        def encode user
          present jwt_token: Authentication.encode({user_id: user.id})
        end
      end

      resources :auth do
        desc "Login"
        params do
          requires :email
          requires :password
        end

        post "/login" do
          user = User.find_by email: params[:email]
          if user&.authenticate params[:password]
            encode user
          else
            error!("Invalid email/password combination", 403)
          end
        end
      end
    end
  end
end
