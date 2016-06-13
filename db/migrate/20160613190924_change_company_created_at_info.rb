class ChangeCompanyCreatedAtInfo < ActiveRecord::Migration
  def change
    change_column :companies, :created_at, :datetime, :null => true, :default => nil
  end
end
