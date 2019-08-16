class ImageSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :created_at, :updated_at, :image_on_disk
end
