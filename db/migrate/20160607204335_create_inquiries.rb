class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.integer :user_id
      t.integer :contact_id
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :zip_code
      t.string :source
      t.string :stage
      t.string :product
      t.string :material
      t.string :color
      t.string :width
      t.string :length
      t.string :quantity
      t.string :lead_time
      t.text :application
      t.boolean :new_lead
      t.boolean :registered
      t.boolean :subscribed
      t.text :comment

      t.timestamps null: false
    end
  end
end
