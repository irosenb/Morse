class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.boolean :open
      t.string :number
      t.datetime :start_date
      t.datetime :end_date
      t.string :name

      t.timestamps
    end
  end
end
