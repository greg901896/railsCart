class AddProductIdaToProductkey < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :productkeys, :products
  end
end
