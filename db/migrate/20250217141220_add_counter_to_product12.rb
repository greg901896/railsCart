class AddCounterToProduct12 < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :user_id, :integer
  end
end
