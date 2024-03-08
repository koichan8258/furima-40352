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

  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day, numericality: { other_than: 1 , message: "can't be blank"}
  validates :selling_price, numericality: { 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999,
    only_integer: true,
    presence: true
  }

end
