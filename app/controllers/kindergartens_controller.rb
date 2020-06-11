class KindergartensController < ApplicationController
  before_action :set_kindergarten, only: [:show, :edit, :update, :destroy]
  def index
    @kindergartens = Kindergarten.all
  end

  def new
    @kindergarten = Kindergarten.new
  end

  def create
    @kindergarten = Kindergarten.new(kindergarten_params)
    if @kindergarten.save
      redirect_to kindergartens_path, notice: '幼稚園情報を新規登録しました！'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kindergarten.update(kindergarten_params)
      redirect_to kindergartens_path, notice: '幼稚園情報を編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @kindergarten.destroy
    redirect_to kindergartens_path, notice: '幼稚園情報を削除しました！'
  end

  private
  def kindergarten_params
    params.require(:kindergarten).permit(:name, :address, :phone_number, :image, :latitude, :longitude)
  end

  def set_kindergarten
    @kindergarten= Kindergarten.find(params[:id])
  end
end
