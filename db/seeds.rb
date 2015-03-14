require 'csv'

TRIPS_FILES = [
  "../Divvy_Trips_2014-Q3-07.csv",
  "../Divvy_Trips_2014-Q4.csv",
  "../Divvy_Trips_2014-Q3-0809.csv",
  "../Divvy_Trips_2014_Q1Q2.csv",
  "../Divvy_Trips_2013.csv"
]

STATIONS_FILE = "../Divvy_Stations_2014-Q3Q4.csv"

def parse_trip_file trip_file
  csv_file = CSV.open trip_file
  header = csv_file.shift

  eof_reached = false
  display_counter = 0

  while !eof_reached do
    display_counter += 1
    print "." if display_counter % 100 == 0

    inserts = []
    500.times do
      if row = csv_file.shift
        row[11] = row[11].to_i
        text = "('" + row.join('\', \'') + "')"
        inserts << text
      else
        eof_reached = true
      end
    end

    sql = <<-SQL
      INSERT INTO trips (id, start_time, stop_time, bike_id, trip_duration, from_station_id, from_station_name, to_station_id, to_station_name, user_type, gender, birth_year) VALUES #{inserts.join(", ")}
    SQL

    Trip.connection.execute(sql)
  end
end

def parse_station_file(station_file)
  csv_file = CSV.open(station_file)
  header = csv_file.shift

  display_counter = 0

  while row = csv_file.shift do
    display_counter += 1
    print "." if display_counter % 100 == 0

    sql = <<-SQL
      INSERT INTO stations (id, name, latitude, longitude, dpcapacity, online_date)
      VALUES ('#{row.join('\', \'')}')
    SQL
    Station.connection.execute(sql)
  end
end


puts "\nStarting db:seed..."
start_time = Time.now

files_to_load = ARGV[1] ? ARGV[1..-1] : TRIPS_FILES

puts "\nLoading these files:"
puts " => " + files_to_load.join("\n => ")

puts "\nEach trip file takes ~5 min to load"

TRIPS_FILES.each do |file|
  puts "\nLoading trip file #{file}...\n"
  parse_trip_file(file)
end

puts "\nLoading station file (just a few seconds)"
parse_station_file(STATIONS_FILE)

puts "Done! (#{Time.now - start_time}s)"
