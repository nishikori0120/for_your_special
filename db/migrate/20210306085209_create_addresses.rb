class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
        t.integer :postcode,          null:false
        t.integer :prefecture_code,   null:false
        t.string :city,               null:false
        t.string :street,             null:false
        t.string :building
        t.references :user
      t.timestamps
    end
  end
end
