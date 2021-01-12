class ProtfoliosController < ApplicationController
  def index
    @protfolios = Protfolio.all.order(created_at: :desc)
  end

  def show
    @protfolio = Protfolio.find(params[:id])
  end

  def new
    @protfolio = current_user.protfolios.build
  end

  def create
    @protfolio = current_user.protfolios.build(protfolio_params)
    if @protfolio.save
      redirect_to protfolio_path(@protfolio), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end
  
  private
  def protfolio_params
    params.require(:protfolio).permit(:title, :content, :url)
  end
end
