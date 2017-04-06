class RemoveProductfromQuote < ActiveRecord::Migration
  def change
    remove_column :quotes, :product, :string
  end
end
