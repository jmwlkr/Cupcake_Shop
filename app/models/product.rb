class Product < ActiveRecord::Base
  validates :shop_id, :price, :name, presence: true

  belongs_to :shop

  has_many :comments
  has_many :likes
end
