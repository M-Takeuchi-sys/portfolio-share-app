class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    protfolio = Protfolio.find(params[:protfolio_id])
    protfolio.likes.create!(user_id: current_user.id)
    redirect_to protfolio_path(protfolio)
  end

  def destroy
    protfolio = Protfolio.find(params[:protfolio_id])
    like = protfolio.likes.find_by!(user_id: current_user.id)

    like.destroy!
    redirect_to protfolio_path(protfolio)
  end
end
