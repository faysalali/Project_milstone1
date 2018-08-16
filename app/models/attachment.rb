class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  has_attached_file :file
  validates_attachment_content_type :file, content_type: ['application/pdf','image/jpeg', 'image/png']
end
