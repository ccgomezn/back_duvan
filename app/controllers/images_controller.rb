class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]

    def create
        image = Image.new(image_params)

        if image.save
            ActionCable.server.broadcast(
                'room_image_channel', content: { message: 'hello' }
            )
            render json: image.image.rails_blob_url, status: :created
        else
            render json: image.errors, status: :unprocessable_entity
        end
    end

    def index
        images = Image.all

        render json: images, status: :ok
    end

    def update
        respond_to do |format|
            if @image.update(image_params)
                ActionCable.server.broadcast(
                'room_image_channel', content: { message: 'hello' }
                )
                format.json { render json: @image, status: :ok  }
            else
                format.json { render json: @image.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_image
        @image = Image.find(params[:id])
    end

    def image_params
        params.require(:image).permit(:state, :image, :name)
    end
end
