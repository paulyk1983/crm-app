class ChangeInquiryAttributeCompanyToCompanyName < ActiveRecord::Migration
  def change
    remove_column :inquiries, :company
  end
end
