class KindergartensController < ApplicationController
  def index
    @kindergartens = Kindergarten.all
  end

  def new
    @kindergarten = Kindergarten.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
