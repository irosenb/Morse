class AddColumnsToConference < ActiveRecord::Migration
  def change
    add_column :conferences, :sid, :string
    add_column :conferences, :token, :string
  end
end
