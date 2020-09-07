class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  validates :title, presence: true
  validate :image_type

  # def thumbnails
  #   self.images.map do |image|
  #     image.variant(resize: '500x500').processed
  #   end
  # end

  def resized_images
    self.images.map { |img| img.variant(resize: '500x500').processed }
  end

  def all_images
    self.map do |post|
      post.resized_images
    end
  end

  private
  def image_type
    if images.attached? == false
      errors.add(:images, "are required to submit a post!")
    end

    images.each do |img|
      if !img.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, "needs to have a JPEG or PNG file type")
      end
    end
  end
end
