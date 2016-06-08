class AddRibbonTypeToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :ribbon_type, :string
  end
end
