class UserController < ApplicationController

  def index
    users = User.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded users', data: users}, status: :ok
  end

  def show
    user = User.find_by_login(params[:login])
    render json: {status: 'SUCCESS', message: 'Loaded user', data: user}, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: {status: 'SUCCESS', message: 'Saved user', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Failed to save user', data: user.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {status: 'SUCCESS', message: 'Deleted user', data: user}, status: :ok
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: {status: 'SUCCESS', message: 'Updated user', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Failed to update user', data: user.errors}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:login, :password)
  end

end
