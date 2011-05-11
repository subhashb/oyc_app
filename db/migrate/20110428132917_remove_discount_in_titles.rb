class RemoveDiscountInTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :discount
  end

  def self.down
  end
end
