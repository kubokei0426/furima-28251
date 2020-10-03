class Exhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery

  validates :image, :name, :text, :price, :category, :status, :fee, :prefecture, :delivery, presence: true
  validates :image, :name, :text, :price, :category, :status, :fee, :prefecture, :delivery, numericality: { other_than: 1 } 

end
