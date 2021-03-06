class ArchivesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_archive, only: %i[edit update destroy]

  def index
    @q = Archive.ransack(params[:q])
    @archives = @q.result(distinct: true).page(params[:page]).per(5)
    page_num = Archive.page(params[:page]).current_page
    @base_level = (page_num - 1) * 5
    if params[:search].present?
      @archives = if params[:title].present?
                    Archive.all.title_search(params[:title]).page(params[:page]).per(5)
                  else
                    Archive.all.order(created_at: :asc).page(params[:page]).per(5)
                  end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @archive = Archive.new
  end

  def create
    @archive = Archive.new(archive_params)
    if @archive.save
      redirect_to archives_path, notice: 'アーカイブを作成しました！'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @archive.update(archive_params)
      redirect_to archives_path, notice: 'アーカイブを編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @archive.destroy
    redirect_to archives_path, notice: 'アーカイブを削除しました！'
  end

  private

  def archive_params
    params.require(:archive).permit(:name, :title, :installation_date, :status_of_use)
  end

  def set_archive
    @archive = Archive.find(params[:id])
  end
end
