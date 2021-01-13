class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_one :footprint
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  mount_uploader :image, ImageUploader

  def feed
    Micropost.where("user_id = ?", id)
  end
end
