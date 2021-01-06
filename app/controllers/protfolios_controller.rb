class ProtfoliosController < ApplicationController
  def index
    @protfolios = Protfolio.all.order(created_at: :desc)
  end
end
