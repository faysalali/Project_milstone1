class ChangeHoursToBeDecimalInTimelogs < ActiveRecord::Migration[5.1]
  def self.change
    change_column :time_logs, :hours, :decimal, precision: 10, scale: 3
  end

  def self.down
    change_column :time_logs, :hours, :decimal, precision: 10, scale: 3
  end
end
