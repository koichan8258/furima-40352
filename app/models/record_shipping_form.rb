class RecordShippingForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :prefecture_id, :municipalities, :street_address, :building_name, :telephon_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_cord, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :street_address, presence: true
  validates :telephon_number, presence: true


  def save
    Record.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_cord: post_cord, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephon_number: telephon_number, record_id: record.id)
  end
end

