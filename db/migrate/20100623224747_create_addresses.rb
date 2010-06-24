class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :user
      t.string :street
      t.string :number
      t.string :zip
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
