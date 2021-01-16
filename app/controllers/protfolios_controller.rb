class ProtfoliosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @protfolio = current_user.protfolios.find(params[:id])
  end

  def update
    @protfolio = current_user.protfolios.find(params[:id])
    if @protfolio.update(protfolio_params)
      redirect_to protfolio_path(@protfolio), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    protfolio = current_user.protfolios.find(params[:id])
    protfolio.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def protfolio_params
    params.require(:protfolio).permit(:title, :content, :url, :eyecatch)
  end
end
