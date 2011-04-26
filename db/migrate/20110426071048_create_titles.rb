class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.string :isbn
      t.string :title
      t.string :publisher
      t.string :author
      t.float :grossamt
      t.string :currency
      t.float :conv_rate
      t.float :discount
      t.float :netamt
      t.integer :bookfair_id
      t.integer :copies_cnt
      t.integer :sold_cnt
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end

  def self.down
    drop_table :titles
  end
end
