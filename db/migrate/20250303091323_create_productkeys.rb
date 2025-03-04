class CreateProductkeys < ActiveRecord::Migration[7.1]
  def change
    create_table :productkeys do |t|
      t.string :title
      t.string :title_code
      t.integer :user_id

      t.timestamps
    end
  end
end
