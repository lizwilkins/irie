class ModifyRole4 < ActiveRecord::Migration
  def change
    change_column_default :users, :role, nil
  end
end
