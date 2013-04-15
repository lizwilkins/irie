class RenameVanAsBus < ActiveRecord::Migration
  def change
    rename_table :vans, :buses
    rename_column :trips, :van_id, :bus_id
  end
end
