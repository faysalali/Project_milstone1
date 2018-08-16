class CreateTimeLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :time_logs do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :hours
      t.timestamps
    end
  end
end
