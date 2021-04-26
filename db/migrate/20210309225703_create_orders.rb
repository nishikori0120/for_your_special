class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :k_name,     null:false
      t.string :r_name,     null:false
      t.string :birthday,   null:false
      t.string :height,     null:false
      t.references :user,     null:false, foreign_key: true
      t.references :address,  null:false, foreign_key: true
      t.timestamps
    end
  end
end
