class AddClientIdToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :client_id, :integer
  end
end
