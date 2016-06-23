class AddAttachmentToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :attachment, :string
  end
end
