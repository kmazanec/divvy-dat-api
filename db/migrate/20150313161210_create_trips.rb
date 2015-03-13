class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :start_time, index: true
      t.datetime :stop_time, index: true
      t.integer :trip_duration, index: true

      t.integer :bike_id, index: true

      t.integer :from_station_id, index: true
      t.string :from_station_name, index: true

      t.integer :to_station_id, index: true
      t.string :to_station_name, index: true

      t.string :user_type, index: true
      t.string :gender, index: true
      t.integer :birth_year, index: true
    end
  end
end
