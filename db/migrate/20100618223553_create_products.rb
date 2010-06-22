class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :front
      t.integer :stock
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
