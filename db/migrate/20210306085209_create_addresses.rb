class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
        t.string :postcode,     null:false
        t.string :prefecture,   null:false
        t.string :city,         null:false
        t.string :street,       null:false
        t.string :building,     null:false
        t.references :user
      t.timestamps
    end
  end
end
