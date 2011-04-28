class CreateIsbns < ActiveRecord::Migration
  def self.up
    create_table :isbns do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :publisher
      t.float :grossamt
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :isbns
  end
end
