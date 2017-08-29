class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.references :stock, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
