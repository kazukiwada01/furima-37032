FactoryBot.define do
  factory :purchase_address do
    user
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code       { '123-4567' }
    ship_from_id      { 2 }
    city_name         { 'test' }
    street            { 'test' }
    phone_number      { '09012345678' }
  end
end
