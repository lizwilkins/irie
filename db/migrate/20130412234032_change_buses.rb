class ChangeBuses < ActiveRecord::Migration
  def change
    rename_column :buses, :designation, :license_number
    add_column :buses, :description, :string
  end
end
