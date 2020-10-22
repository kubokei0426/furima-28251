class PurchaserShipping
  include ActiveModel::Model
  attr_accessor  :postal_code,:prefecture_id,:city,:addresses,:building,:phone_number,:user,:token,:exhibition_id
  
  with_options presence: true do
    validates :token
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :addresses
    validates :phone_number,format: {with: /\A[0-9]+\z/}
  end  
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    @purchaser = Purchaser.create
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
       addresses: addresses, phone_number: phone_number,user_id: user.id)
  end

end