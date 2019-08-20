class ImageSerializer < ActiveModel::Serializer
    attributes :id, :name, :state, :created_at, :updated_at, :image_url
    include Rails.application.routes.url_helpers

    def image_url
        rails_blob_url(self.object.image, only_path: true)
    end
end
