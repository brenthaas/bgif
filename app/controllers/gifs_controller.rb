class GifsController < ApplicationController
  def create
    @gif = Gif.create(url: url_param)
    respond_to do |format|
      format.json { render json: @gif, status: :created }
    end
  end

  private

  def url_param
    params.require(:url)
  end
end
