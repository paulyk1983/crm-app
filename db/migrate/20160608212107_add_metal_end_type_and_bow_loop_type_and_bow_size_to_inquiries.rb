class AddMetalEndTypeAndBowLoopTypeAndBowSizeToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :metal_end_type, :string
    add_column :inquiries, :bow_loop_type, :string
    add_column :inquiries, :bow_size, :string
  end
end
