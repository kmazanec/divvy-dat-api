class Station < ActiveRecord::Base
  has_many :from_trips, class: Trip, foreign_key: :from_station_id
  has_many :to_trips, class: Trip, foreign_key: :to_station_id
end
