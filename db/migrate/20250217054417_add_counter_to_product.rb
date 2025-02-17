class AddCounterToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :count_cart, :integer
  end
end
