class ImageSerializer < ActiveModel::Serializer
    attributes :id, :name, :state, :created_at, :updated_at, :image_url
    
    def image_url
        ActiveStorage::rails_blob_url(self.object.image)
    end
end
