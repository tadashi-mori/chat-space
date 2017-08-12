class Message < ApplicationRecord
  # validates :body, :image, presence:true
  belongs_to :group
  belongs_to :user, foreign_key: current_user
  mount_uploader :image, ImageUploader
end
