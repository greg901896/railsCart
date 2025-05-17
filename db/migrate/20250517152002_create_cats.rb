class CreateCats < ActiveRecord::Migration[7.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :email
      t.string :tel

      t.timestamps
    end
  end
end
