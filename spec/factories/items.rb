FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name              { 'test' }
    description       { 'test' }
    category_id       { 2 }
    status_id         { 2 }
    delivery_fee_id   { 2 }
    ship_from_id      { 2 }
    ship_day_id       { 2 }
    price             { 2000 }
    user
  end
end
