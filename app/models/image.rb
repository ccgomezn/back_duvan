class Image < ApplicationRecord
    has_one_attached :image

    def image_on_disk
      ActiveStorage::Blob.service.send(:path_for, image.key)
    end
end
