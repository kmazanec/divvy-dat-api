json.array!(@trips) do |trip|
  json.extract! trip, :id, :start_time, :stop_time, :bike_id, :trip_duration, :from_station_id, :from_station_name, :to_station_id, :to_station_name, :user_type, :gender, :birth_year
  json.url trip_url(trip, format: :json)
end
