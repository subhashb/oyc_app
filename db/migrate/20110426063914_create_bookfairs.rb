class CreateBookfairs < ActiveRecord::Migration
  def self.up
    create_table :bookfairs do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :bookfairs
  end
end
