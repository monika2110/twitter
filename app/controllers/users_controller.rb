class UsersController < ApplicationController

  before_action :set_user, only: [:show]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

  end

  # # GET /users/1
  # # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @relation = @user.followers.find_by(follower: current_user)
    @tweets = Tweet.all.where(user_id: @user.id).order('created_at DESC')


  end

  # GET /users/1/edit

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.


end