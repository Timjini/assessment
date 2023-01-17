class Visual < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :comments, dependent: :destroy
    # validate image form and size
    validate :image_type
    validate :image_size

    # validate image form
    def image_type
        if image.attached? && !image.content_type.in?(%('image/jpeg image/png'))
            image.purge
            errors.add(:image, 'must be a JPEG or PNG')
        end
    end

    # validate image size
    def image_size
        if image.attached? && image.byte_size > 1.megabyte
            image.purge
            errors.add(:image, 'is too big')
        end
    end

end
