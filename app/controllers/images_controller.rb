class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]

  def create
    @image = Image.create!(image_params)
    render json: {image:{ url: @image.file.url }}, content_type: "text/html"
  end

  def update
    @image = Image.find(params[:id])
    @image.update!
    render json: { image: { url: @image.file.url } }, content_type: "text/html"
  end

  private
    def image_params
      params.permit(:file)
    end

end
