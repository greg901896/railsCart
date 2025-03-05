class AddCounterToProductkey < ActiveRecord::Migration[7.1]
  def change
    add_column :productkeys, :product_id, :integer
  end
end
