class Comment < ActiveRecord::Base
  validates :product_id, :user_id, :text, presence: true

  belongs_to :product
  belongs_to :user
end
