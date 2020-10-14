class Purchaser < ApplicationRecord
  validates :exhibition_id, presence: true
  validates :user_id, presence: true
  validates :shipping_id, presence: true
end
