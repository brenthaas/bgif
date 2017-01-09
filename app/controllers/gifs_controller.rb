class GifsController < ApplicationController
  def create
    @gif = Gif.create(url: url_param, title: title_param)

    if @gif.save
      respond_to do |format|
        format.json do
          render json: @gif, status: :created, serializer: GifSerializer
        end
      end
    else
      respond_to do |format|
        format.json do
          render errors: @gif.errors.full_messages, status: :unprocessable_entity
        end
      end
    end
  end


  private

  def title_param
    params.require(:title)
  end

  def url_param
    params.require(:url)
  end
end
