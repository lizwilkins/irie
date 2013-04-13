class RenameRoutesDesignationToNumber < ActiveRecord::Migration
  def change
    rename_column :routes, :designation, :number
  end
end
