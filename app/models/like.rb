class Like < ActiveRecord::Base
  validates :user_id, :product_id, presence: true

  belongs_to :user, dependent: :destroy
  belongs_to :product, dependent: :destroy
end
