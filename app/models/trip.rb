class Trip < ActiveRecord::Base
  belongs_to :from_station, foreign_key: :from_station_id, class: Station
  belongs_to :to_station, foreign_key: :to_station_id, class: Station
end
