class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
        t.string :first_name,         null: false
        t.string :last_name,          null: false
        t.string :first_name_kana,    null: false
        t.string :last_name_kana,     null: false
        t.string :tel,                null: false
        t.integer :postcode,          null: false
        t.string :prefecture,         null: false
        t.string :city,               null: false
        t.string :street,             null: false
        t.string :building
        t.references :user
      t.timestamps
    end
  end
end
