class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :project_id

      t.timestamps
    end
  end
end
