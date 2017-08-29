class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name

      t.timestamps
    end
    add_index :stocks, :name, unique: true
  end
end
