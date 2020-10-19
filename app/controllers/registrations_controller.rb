class RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  # sign up
  def create
    user = User.new user_params
    if user.save
      render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          data: {user: user}
      }, status: :ok
    else
      render json: {
          messages: "Sign Up Failded",
          is_success: false,
          data: {}
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: [params]
    }, status: :bad_request
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