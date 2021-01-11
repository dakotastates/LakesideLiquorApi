class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :profile]
  before_action :find_user, only:[:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end


  private

  def user_params
    params.require(:user).permit( :id, :username, :password)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end

end
