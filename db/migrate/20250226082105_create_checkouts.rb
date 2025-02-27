class CreateCheckouts < ActiveRecord::Migration[7.1]
  def change
    create_table :checkouts do |t|
      t.integer :user_id
      t.integer :total_price
      t.string :delivery

      t.timestamps
    end
  end
end
