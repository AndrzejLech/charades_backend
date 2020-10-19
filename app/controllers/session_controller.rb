class SessionController < ApplicationController

  def create
    
    @user = User.find_by_login(params[:login])

    if @user == nil
      render json: {status: 'ERROR', message: 'Failed to log in', data: "User doesn't exist"}, status: :unprocessable_entity
    else
      if @user.password == params[:password]
        render json: {status: 'SUCCESS', message: 'Logged in', data: @user}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Failed to log in', data: "Password is invalid"}, status: :unprocessable_entity
      end
    end
  end

end