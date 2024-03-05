# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname, null: false
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :last_name, null:false
      t.string :first_name, null:false
      t.string :last_name_furigana, null:false
      t.string :first_name_furigana, null:false
      t.date :birth, null:false
      t.timestamps null: false
    end
  end
end