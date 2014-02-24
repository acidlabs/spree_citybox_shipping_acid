class CreateCityboxOrders < ActiveRecord::Migration
  def change
    create_table :citybox_orders do |t|
      t.string :customer_name
      t.string :citybox_location
      t.string :city
      t.string :country
      t.string :product
      t.string :size
      t.boolean :package    ,:default => true
      t.references :order
      t.string :content
      t.integer :total
      t.decimal :kilogram   ,:precision => 8, :scale => 2, :default => 0.0
      t.decimal :volume     ,:precision => 8, :scale => 2, :default => 0.0
      t.string :ship_address
      t.string :ship_city
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
