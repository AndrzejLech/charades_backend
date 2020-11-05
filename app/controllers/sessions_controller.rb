class SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create

  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in "user", @user
      render json: {
          messages: "Signed In Successfully",
          is_success: true,
          data: {user: @user}
      }, status: :ok
    else
      render json: {
          messages: "Signed In Failed - Unauthorized",
          is_success: false,
          data: {}
      }, status: :unauthorized
    end
  end

private

  def sign_in_params
    params.permit :email, :password
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
        if @user.valid_password?(sign_in_params[:password])
        render json: {
        message: "Signed User",
        is_success: true,
        data: @user,
        }, status: 200
        else
              render json: {
                  message: "Passwords doesn't match",
                  is_success: false,
                  data: {},
               }, status: 400
        end
    else
      render json: {
          message: "User doesn't exist",
          is_success: false,
          data: {},
       },  status: 400
    end
  end
end

#post na sign_in
#{
# sign_in: {
#  email:abc@example.com,
#  password:password,
# }
#}