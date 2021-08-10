class Api::V1::UsersController < ApplicationController
  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      new_user.update(api_key: SecureRandom.hex(10))
      render json: UserSerializer.new(new_user), status: 201
    else
      if user[:password] != user[:password_confirmation]
        render json: {error: 'Please make sure your password and password confirmation match.'}, status: 400
      else
        render json: {error: 'Email already registered. Please login to continue'}, status: 400
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
