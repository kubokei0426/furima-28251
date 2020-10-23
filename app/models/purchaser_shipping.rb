class PurchaserShipping
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :exhibition_id, :purchaser_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A[0-9]+\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchaser = Purchaser.create(exhibition_id: @exhibition_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                    phone_number: phone_number, purchaser_id: purchaser.id)
  end
end
