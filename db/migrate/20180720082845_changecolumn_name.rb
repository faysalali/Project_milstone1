class ChangecolumnName < ActiveRecord::Migration[5.1]
  def change
     rename_column :users, :is_female, :gender
  end
end
