class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :user_id
      t.integer :contact_id
      t.integer :company_id
      t.integer :inquiry_id
      t.integer :sample_id
      t.string :secondary_contact
      t.string :name
      t.integer :number
      t.string :product
      t.integer :quantity
      t.decimal :unit_price
      t.string :quantity_discount
      t.string :order_type
      t.text :note_for_sales
      t.text :note_for_lead
      t.string :lead_time
      t.string :ship_from
      t.string :ship_method
      t.string :country_of_origin
      t.datetime :valid_till

      t.timestamps null: false
    end
  end
end
