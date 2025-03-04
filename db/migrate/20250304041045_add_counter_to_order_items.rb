class AddCounterToOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :type, :string
  end
end
