class RelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    other_user = User.find(params[:user_id])
    @relation = Relation.new(follower_id: current_user.id, followee_id: other_user.id)
    @relation.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy
    redirect_back(fallback_location: root_path)
  end
end
