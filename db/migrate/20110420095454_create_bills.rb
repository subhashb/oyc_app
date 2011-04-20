class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.date :date_of_billing
      t.float :amount
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
