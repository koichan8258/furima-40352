class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :last_name, null:false, default: ""
      t.string :first_name, null:false, default: ""
      t.string :last_name_furigana, null:false, default: ""
      t.string :first_name_furigana, null:false, default: ""
      t.date :birth, null:false
      t.timestamps null: false
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end