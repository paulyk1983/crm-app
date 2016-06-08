class RemoveModifiedTimeFromInquiries < ActiveRecord::Migration
  def change
    remove_column :inquiries, :modified_time, :datetime
  end
end
