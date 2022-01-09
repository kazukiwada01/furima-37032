class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :ship_from_id, :city_name, :street, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  end
  validates :ship_from_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :city_name
    validates :street
    validates :phone_number
  end
  validates :phone_number, length: { minimum: 10, maximum: 11, message: 'is too short' }
  validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input only numbers' }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, ship_from_id: ship_from_id, city_name: city_name, street: street,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
