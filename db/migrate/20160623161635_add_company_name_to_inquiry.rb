class AddCompanyNameToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :company_name, :string
  end
end
