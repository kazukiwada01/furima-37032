class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_from_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
