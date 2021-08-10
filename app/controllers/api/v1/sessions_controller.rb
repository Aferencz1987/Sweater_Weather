class Api::V1::SessionsController < ApplicationController
  def create

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user), status: 201
    else
      render json: {error: 'Incorrect password or email.'}, status: 400
    end
  end
end
