class Prototype < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  has_one_attached :image

  validate :image_presence

  private

  def image_presence
    errors.add(:image, 'must be attached') unless image.attached?
  end
  
end
