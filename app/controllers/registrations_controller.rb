class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(user_params)
    if user.save
      render json: {
          messages: "Sign Up successfully",
          status: "SUCCESS",
          data: {user: user}
      }, status: :ok
    else
      render json: {
          messages: "Sign Up failed",
          status: "ERROR",
          data: {user: user_params}
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
#post na sign_up
#{
#  user: {
#   email:abc@example.com,
#   password:password,
#   password_confirmation:password,
#  }
# }