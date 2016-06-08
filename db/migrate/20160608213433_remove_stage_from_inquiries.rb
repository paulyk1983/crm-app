class RemoveStageFromInquiries < ActiveRecord::Migration
  def change
    remove_column :inquiries, :stage, :string
  end
end
