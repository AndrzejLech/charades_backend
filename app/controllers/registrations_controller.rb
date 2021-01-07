class RegistrationsController < Devise::RegistrationsController
  # sign up
  def create
    @user = User.new user_params
    if @user.save
      render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          data: {user: @user}
      }, status: :ok
    else
      render json: {
          messages: @user.errors,
          is_success: false,
          data: {}
      }, status: :unprocessable_entity
    end
  end

  private def user_params
    params.permit(:email, :password, :password_confirmation, :username)
  end
end

#post na sign_up
#{
#  user: {
#   email:abc@example.com,
#   password:password,
#   password_confirmation:password,
#   username:example,
#  }
# }