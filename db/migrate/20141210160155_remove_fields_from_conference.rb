class RemoveFieldsFromConference < ActiveRecord::Migration
  def change
    remove_column :conferences, :sid, :string
    remove_column :conferences, :token, :string
    remove_column :conferences, :number, :string
  end
end
