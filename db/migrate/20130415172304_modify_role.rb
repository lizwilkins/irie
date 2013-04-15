class ModifyRole < ActiveRecord::Migration
  def change
    change_column :users, :role, :string
  end
end
