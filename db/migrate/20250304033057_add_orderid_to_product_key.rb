class AddOrderidToProductKey < ActiveRecord::Migration[7.1]
  def change
    add_column :productkeys, :order_id, :string
  end
end
