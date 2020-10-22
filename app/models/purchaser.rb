class Purchaser < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
  has_one :shipping
end
