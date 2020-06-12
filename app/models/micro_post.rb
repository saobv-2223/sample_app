class MicroPost < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user
  has_one_attached :image
  scope :by_created_at, -> {order created_at: :desc}
  scope :feed, -> (user_ids) {where user_id: user_ids}
  validates :content, presence: true,
            length: {maximum: Settings.content_length}
  validates :user_id, presence: true
  validates :image, content_type: Settings.file_type.split
end
