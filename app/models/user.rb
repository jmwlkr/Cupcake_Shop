class User < ActiveRecord::Base
  validates :password, :fname, :lname, :email, presence: true
  validates :password, length: {in: 6..10}
  validates :email, uniqueness: true

  has_many :shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :products, through: :shops, source: :products
end
