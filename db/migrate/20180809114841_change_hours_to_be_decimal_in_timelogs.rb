class ChangeHoursToBeDecimalInTimelogs < ActiveRecord::Migration[5.1]
  def self.change
    change_column :time_logs, :hours, :decimal, precision: 5, scale: 1
  end

  def self.down
    change_column :time_logs, :hours, :decimal, precision: 5, scale: 1
  end
end
