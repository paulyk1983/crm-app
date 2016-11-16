class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :contacts, :company, :company_name
  end
end
