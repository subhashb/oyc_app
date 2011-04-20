class CreateBillitems < ActiveRecord::Migration
  def self.up
    create_table :billitems do |t|
      t.string :isbn
      t.string :title
      t.float :mrp

      t.timestamps
    end
  end

  def self.down
    drop_table :billitems
  end
end
