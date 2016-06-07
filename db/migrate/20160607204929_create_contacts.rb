class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :mailing_street
      t.string :mailing_suite
      t.string :mailing_city
      t.string :mailing_state
      t.string :mailing_zip
      t.string :shipping_street
      t.string :shipping_suite
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zip
      t.string :country
      t.string :secondary_email
      t.text :customer_notes
      t.boolean :registered
      t.boolean :subscribed
      t.integer :rating
      t.string :type

      t.timestamps null: false
    end
  end
end
