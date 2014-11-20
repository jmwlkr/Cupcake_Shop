class Product < ActiveRecord::Base
  validates :shop_id, :price, :name, presence: true

  belongs_to :shop

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
