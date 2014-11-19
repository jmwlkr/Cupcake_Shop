class User < ActiveRecord::Base
  validates :password, :fname, :lname, :email, presence: true
  validates :password, length: {in: 6..10}
  validates :email, uniqueness: true

  has_many :shops
  has_many :comments
  has_many :likes

  has_many :products, through: :shops, source: :products
end
