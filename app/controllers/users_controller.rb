class UsersController < ApplicationController
  def index 
    render json: User.all
  end
  
  def create
    # not sure i'm checking this right i think it's close or right in login but do i need to do some salting in this create action too??
    user = User.create(user_params)

    if user.save
      render json: user, except: :password, status: :accepted
    else 
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def login
    user = User.find_by(username: user_params[:username])
    authenticated = user.try(:authenticate, params[:password])

    if authenticated
      render json: user, status: :accepted
    else 
      render json: {message: 'Invalid username or password'}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private 

  def user_params
    params.permit(:user).require(:username, :password, :password_confirmation, :images)
  end
end
