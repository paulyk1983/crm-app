class ChangeCompanyModifiedAtInfo < ActiveRecord::Migration
  def change
    change_column :companies, :updated_at, :datetime, :null => true, :default => nil
  end
end
