class RemoveCurrencyFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :currency
  end

  def self.down
  end
end
