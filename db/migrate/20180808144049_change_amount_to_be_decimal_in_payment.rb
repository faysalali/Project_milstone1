class ChangeAmountToBeDecimalInPayment < ActiveRecord::Migration[5.1]
  def self.up
    change_column :payments, :amount, :decimal
  end

  def self.down
    change_column :payments, :amount, :decimal
  end
end
