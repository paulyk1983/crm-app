class AddCreatedTimeAndModifiedTimeToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :created_time, :datetime
    add_column :inquiries, :modified_time, :datetime
  end
end
