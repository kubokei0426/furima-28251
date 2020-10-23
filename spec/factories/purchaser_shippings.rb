FactoryBot.define do
  factory :purchaser_shipping do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '東京都' }
    addresses { '千代田区' }
    phone_number { '00000000' }
    token {'00000000'}
  end
end