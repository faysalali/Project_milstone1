class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
