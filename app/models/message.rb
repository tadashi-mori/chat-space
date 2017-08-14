class Message < ApplicationRecord
  validates :body_or_image, presence:true
  belongs_to :group
  belongs_to :user
  mount_uploader :image, ImageUploader

  private
  def body_or_image
    body.presence || image.presence
  end
end
