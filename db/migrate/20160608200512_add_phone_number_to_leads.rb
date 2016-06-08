class AddPhoneNumberToLeads < ActiveRecord::Migration
  def change
    add_column :inquiries, :phone_number, :string
  end
end
