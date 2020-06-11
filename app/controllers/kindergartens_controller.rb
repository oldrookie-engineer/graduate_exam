class KindergartensController < ApplicationController
  def index
    @kindergartens = Kindergartens.all
  end
end
