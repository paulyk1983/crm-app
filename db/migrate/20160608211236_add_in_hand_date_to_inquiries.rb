class AddInHandDateToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :in_hand_date, :date
  end
end
