class Comment < ActiveRecord::Base
  validates :product_id, :user_id, :text, presence: true

  belongs_to :product, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
