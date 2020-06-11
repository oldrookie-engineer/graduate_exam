class KindergartensController < ApplicationController
  def index
    @kindergartens = Kindergarten.all
  end

  def new
    @kindergarten = Kindergarten.new
  end

  def create
    @kindergarten = Kindergarten.new(kindergarten_params)
    if @kindergarten.save
      redirect_to kindergartens_path, notice: '幼稚園を新規登録しました！'
    else
      render :new
    end
  end

  def show
    @kindergarten= Kindergarten.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def kindergarten_params
    params.require(:kindergarten).permit(:name, :address, :phone_number, :image, :latitude, :longitude)
  end

  def set_paramas
    @kindergarten= Kindergarten.find(params[:id])
  end
end
