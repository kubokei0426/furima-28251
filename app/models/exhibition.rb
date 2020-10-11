class Exhibition < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery

  with_options presence: true do
    VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates :image
    validates :name
    validates :text
    validates :price, format: { with: VALID_PRICE_REGEX }, numericality: { only_integer: true,
                                                                           greater_than_or_equal_to: 300, less_than: 10_000_000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :fee_id
      validates :prefecture_id
      validates :delivery_id
    end
  end
end
