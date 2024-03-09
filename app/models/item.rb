class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :selling_price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true,
    presence: true
  }
end
