class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :gadget

  mount_uploader :image, ImageUploader
end
