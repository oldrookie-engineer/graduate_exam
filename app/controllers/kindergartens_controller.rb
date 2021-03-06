class KindergartensController < ApplicationController
  before_action :set_kindergarten, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @q = Kindergarten.ransack(params[:q])
    @kindergartens = @q.result(distinct: true).page(params[:page]).per(5)
    page_num = Kindergarten.page(params[:page]).current_page
    @base_level = (page_num - 1) * 5
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @kindergarten = Kindergarten.new
    @kindergarten.stations.build
    @kindergarten.build_authorization
  end

  def create
    @kindergarten = Kindergarten.new(kindergarten_params)
    if @kindergarten.save
      redirect_to kindergartens_path, notice: '幼稚園情報を新規登録しました！'
    else
      render :new
    end
  end

  def show; end

  def edit; end

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
    params.require(:kindergarten).permit(:name, :address, :phone_number, :image, :image_cache, :cover_image, :cover_image_cache, :latitude, :longitude, stations_attributes: %i[route station_name walk_time id _destroy], authorization_attributes: %i[principal installation_date number_of_classes capacity number_of_students school_area school_floor_area id _destroy])
  end

  def set_kindergarten
    @kindergarten = Kindergarten.find(params[:id])
  end
end
