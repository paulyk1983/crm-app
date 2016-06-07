class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.text :company_notes
      t.string :twitter_handle
      t.string :phone_number
      t.text :address

      t.timestamps null: false
    end
  end
end
