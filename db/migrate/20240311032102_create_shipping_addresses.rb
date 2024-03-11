class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_cord, null:false
      t.integer :prefectuer, null:false
      t.string :municipalities, null:false
      t.string :street_address, null:false
      t.string :building_name
      t.string :telephon_number, null:false
      t.references :record,foreign_key: true, null: false
      t.timestamps
    end
  end
end
