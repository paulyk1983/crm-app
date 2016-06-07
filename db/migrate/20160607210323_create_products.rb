class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :sku
      t.decimal :unit_price
      t.decimal :cost
      t.string :short_description
      t.text :description
      t.string :vendor
      t.string :category
      t.integer :qty_in_stock

      t.timestamps null: false
    end
  end
end
