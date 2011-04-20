class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string :invoice_no
      t.date :date_of_invoice
      t.string :isbn
      t.string :title
      t.string :publisher
      t.string :author
      t.integer :quantity
      t.float :grossamt
      t.string :currency
      t.float :conv_rate
      t.float :discount
      t.float :netamt
      t.string :received_cnt
      t.string :sold_cnt
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
