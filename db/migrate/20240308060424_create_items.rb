class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.text :explain, null:false
      t.integer :category_id, null:false
      t.integer :situation_id, null:false
      t.integer :delivery_charge_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :shipping_day_id, null:false
      t.integer :selling_price, null:false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end