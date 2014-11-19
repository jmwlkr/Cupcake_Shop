class Shop < ActiveRecord::Base
  validates :address, :name, :user_id, :zip, :city, :state, presence: true
  validates :zip, length: {is: 5}
  validates :state, length: {is: 2}

  belongs_to :user, dependent: :destroy
  has_many :products
end
