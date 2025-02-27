class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.string :title
      t.integer :price
      t.integer :count_cart
      t.integer :user_id
      t.string :order_id

      t.timestamps
    end
  end
end
