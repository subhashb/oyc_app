class CreateStockaudititems < ActiveRecord::Migration
  def self.up
    create_table :stockaudititems do |t|
      t.integer :bookfair_id
      t.string :isbn
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end

  def self.down
    drop_table :stockaudititems
  end
end
