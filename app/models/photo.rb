class Photo < ActiveRecord::Base
  attr_accessible :image
  has_attached_file :image

  include Rails.application.routes.url_helpers

  belongs_to :product
    validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
    has_attached_file :image, styles: { medium: "320x240>", :thumb => "100x100>"}

      def to_jq_image
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      #"delete_url" => image_path(self),
      "delete_type" => "DELETE" 
    }
  end

end
