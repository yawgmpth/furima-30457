class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_code,       null: false
      t.integer :delivery_area_id, null: false
      t.string  :city,             null: false   
      t.string  :address,          null: false
      t.string  :building,         null: false
      t.string  :telephone,        null: false
      t.references :order,         foreign_key: true
      
      t.timestamps
    end
  end
end
