class Product < ActiveRecord::Base
  validates :shop_id, :price, :name, presence: true

  belongs_to :shop

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :avatar, :styles => {
    :medium => "300x300>",
    :small => "200x200#",
    :thumb => "150x150"
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
