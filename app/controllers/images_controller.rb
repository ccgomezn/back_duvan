class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]

  def create
    image = Image.new(image_params)
    self.fcm_call_notification

    if image.save
      ActionCable.server.broadcast(
          'room_image_channel', content: {message: 'hello'}
      )
      render json: rails_blob_url(image.image), status: :created
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
            'room_image_channel', content: {message: 'hello'}
        )
        format.json { render json: @image, status: :ok }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def fcm_call_notification
    fcm = FCM.new(ENV['push_id'], :timeout => 30)
    options = {notification: {title: "Nuevo pedido!", body: "Hola, tienes un nuevo pedido en la bodega!", priority: "high", collapse_key:"updated_score"},
               priority: "high", collapse_key:"updated_score"}
    response = fcm.send_to_topic('global',
                                 options)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:state, :image, :name)
  end


end
