class ImagesController < ApplicationController
    def create
        image = Image.new(image_params)

        if image.save

            ActionCable.server.broadcast(
                'room_image_channel', content: {message: "hello"}
            )
            render json: image.image_on_disk, status: :created
        else
            render json: image.errors, status: :unprocessable_entity
        end
    end

    def index
        images = Image.all

        render json: images, status: :ok
    end

    def update
        image = Image.find(params[:id])

        if image.update(image_params)
            ActionCable.server.broadcast(
                'room_image_channel', content: {message: "hello"}
            )
            render json: image, status: :ok
        else
            render json: image.errors, status: :unprocessable_entity
        end
    end

    private
    def image_params
    params.require(:image).permit(:state, :image, :name)
    end
end
