class AddFieldsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :stock, :integer
    add_column :products, :url, :string
  end
end
