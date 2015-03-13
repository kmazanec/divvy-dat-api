class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name, index: true
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.integer :dpcapacity, index: true
      t.datetime :online_date, index: true
    end
  end
end
