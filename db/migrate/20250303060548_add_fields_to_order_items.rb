class AddFieldsToOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :stock, :integer
    add_column :order_items, :url, :string
  end
end
