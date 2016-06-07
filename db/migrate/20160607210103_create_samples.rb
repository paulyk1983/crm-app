class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.integer :user_id
      t.integer :contact_id
      t.integer :company_id
      t.integer :inquiry_id
      t.integer :quote_id
      t.integer :product_id
      t.string :name
      t.string :status
      t.text :note_to_receiver
      t.text :note_to_sales
      t.string :price
      t.string :lead_time
      t.string :street
      t.string :suite
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :shipping_method
      t.boolean :drop_ship
      t.string :custom_color
      t.string :custom_length
      t.string :custom_width
      t.string :custom_other

      t.timestamps null: false
    end
  end
end
