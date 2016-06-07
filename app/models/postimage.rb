class Postimage < ActiveRecord::Base
    mount_uploader :image, ImageUploader
end
