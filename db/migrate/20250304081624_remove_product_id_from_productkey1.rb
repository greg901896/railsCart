class RemoveProductIdFromProductkey1 < ActiveRecord::Migration[7.1]
  def change
    remove_column :productkeys, :product_id, :integer
  end
end
