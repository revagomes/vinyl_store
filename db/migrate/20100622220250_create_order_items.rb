class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.integer :quantity
      t.float :total

      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
