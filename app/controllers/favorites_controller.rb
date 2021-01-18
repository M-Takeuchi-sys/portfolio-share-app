class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @protfolios = current_user.favorite_protfolios
  end
end
