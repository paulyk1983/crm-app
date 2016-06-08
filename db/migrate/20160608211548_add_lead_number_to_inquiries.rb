class AddLeadNumberToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :lead_number, :integer
  end
end
