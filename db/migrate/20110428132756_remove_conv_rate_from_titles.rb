class RemoveConvRateFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :conv_rate
  end

  def self.down
  end
end
