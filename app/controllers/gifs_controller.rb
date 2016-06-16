class GifsController < ApplicationController
  def create
    render json: { foo: "params: #{create_gif_params}"}
  end

  private

  def create_gif_params
    params.require(:gif).permit(:name, :url)
  end
end
