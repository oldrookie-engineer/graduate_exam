class ApplicationDocumentsController < ApplicationController
  def index
    @q = ApplicationDocument.ransack(params[:q])
    @application_documents = @q.result(distinct: true)
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

  def destroy
    @application_document = ApplicationDocument.find(params[:id])
    @application_document.destroy
    redirect_to application_documents_path, notice: '申請を削除しました！'
  end

  private
  def application_document_params
    params.require(:application_document).permit(:name, :title, :application_date, :processing_deadline)
  end
end
