class AddDefaultValueToOpen < ActiveRecord::Migration
  def change
    change_column_default :conferences, :open, false
  end
end
