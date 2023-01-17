class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :visuals, dependent: :destroy

  # validate avatar form and size
  validate :avatar_type 
  validate :avatar_size

  # validate user email existence
  validates :email, presence: true
  



  # validate avatar form
  def avatar_type
    if avatar.attached? && !avatar.content_type.in?(%('image/jpeg image/png'))
      avatar.purge
      errors.add(:avatar, 'must be a JPEG or PNG')
    end
  end

  # validate avatar size
  def avatar_size
    if avatar.attached? && avatar.byte_size > 1.megabyte
      avatar.purge
      errors.add(:avatar, 'is too big')
    end
  end
end
