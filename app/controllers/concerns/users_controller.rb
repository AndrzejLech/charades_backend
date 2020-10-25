class UsersController < Devise::RegistrationsController

  def create
    user = User.new(user_params)

    if user.save
      render json: {status: 'Succes', message: 'saved user', data: user}, status: :ok
    else
      render json: {status: 'Error', message: 'failed to save user', data: user}, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end