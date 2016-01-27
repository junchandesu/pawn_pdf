class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.string :product_name
      t.integer :price
      t.integer :quantity
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
