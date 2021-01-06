class ProtfoliosController < ApplicationController
  def index
    @protfolios = Protfolio.all.order(created_at: :desc)
  end

  def show
    @protfolio = Protfolio.find(params[:id])
  end
end
