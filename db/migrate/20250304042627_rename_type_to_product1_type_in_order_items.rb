class RenameTypeToProduct1TypeInOrderItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :order_items, :type, :product_type
  end
end
