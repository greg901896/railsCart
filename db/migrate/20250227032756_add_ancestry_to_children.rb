class AddAncestryToChildren < ActiveRecord::Migration[7.1]
  def change
    add_column :children, :ancestry, :string
    add_index :children, :ancestry
  end
end
