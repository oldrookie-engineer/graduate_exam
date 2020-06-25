class ApplicationDocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_application_document, only: [:edit, :update, :destroy]

  def index
    @q = ApplicationDocument.ransack(params[:q])
    @application_documents = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def new
    @application_document = ApplicationDocument.new
  end

  def create
    @application_document = ApplicationDocument.new(application_document_params)
    if @application_document.save
      redirect_to application_documents_path, notice: '申請を作成しました！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @application_document.update(application_document_params)
      redirect_to application_documents_path, notice: '申請を編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @application_document.destroy
    redirect_to application_documents_path, notice: '申請を削除しました！'
  end

  private
  def application_document_params
    params.require(:application_document).permit(:name, :title, :application_date, :processing_deadline)
  end

  def set_application_document
    @application_document = ApplicationDocument.find(params[:id])
  end
end
