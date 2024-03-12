class RecordShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :prefecture_id, :municipalities, :street_address, :building_name, :telephon_number, :selling_price, :token
 




  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :telephon_number, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }
    validates :token
  end


  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_cord: post_cord, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephon_number: telephon_number, record_id: record.id)
  end
end

