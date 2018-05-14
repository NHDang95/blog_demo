class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  # default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 6}
  validates :content, presence: true, length: {maximum: 255}
  validate :picture_size

  scope :load_data, -> {
    order(created_at: :desc)
  }

  scope :feed, ->(following_ids, id) {#truyen tham so vao
    where("user_id IN (?) OR user_id =?", following_ids, id)
  }

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
