# require_relative 'stadium'
# require_relative 'section'
# require 'yabo_tracker'

wrigley = Stadium.create!(name: "Wrigley Field", 
							home_plate_coord_lat: 41.947911,
						  home_plate_coord_lon: -87.655812,
						  rf_line_ccw_from_east: 5.4,
						  tracker_id: "2015_4737",
						  lat_feet: 364409.0,
						  lon_feet: 272032.0)

sections = { "301" => {y1: 41.948895, x1: -87.655961, y2: 41.948942, x2: -87.655881, home_runs: 0},
						 "302" => {y1: 41.948892, x1: -87.655864, y2: 41.948945, x2: -87.655744, home_runs: 0},
						 "303" => {y1: 41.948897, x1: -87.655729, y2: 41.948947, x2: -87.655616, home_runs: 0},
						 "304" => {y1: 41.948865, x1: -87.655621, y2: 41.948952, x2: -87.655417, home_runs: 0},
						 "305" => {y1: 41.948846, x1: -87.655422, y2: 41.948951, x2: -87.655237, home_runs: 0},
						 "306" => {y1: 41.948828, x1: -87.655250, y2: 41.948940, x2: -87.655064, home_runs: 0},
						 "307" => {y1: 41.948817, x1: -87.655076, y2: 41.948935, x2: -87.654986, home_runs: 0},
						 "311" => {y1: 41.948714, x1: -87.654788, y2: 41.948732, x2: -87.654669, home_runs: 0},
						 "312" => {y1: 41.948680, x1: -87.654748, y2: 41.948628, x2: -87.654581, home_runs: 0},
						 "313" => {y1: 41.948594, x1: -87.654679, y2: 41.948516, x2: -87.654497, home_runs: 0},
						 "314" => {y1: 41.948497, x1: -87.654637, y2: 41.948388, x2: -87.654462, home_runs: 0},
						 "315" => {y1: 41.948370, x1: -87.654624, y2: 41.948252, x2: -87.654430, home_runs: 0},
						 "316" => {y1: 41.948232, x1: -87.654581, y2: 41.948172, x2: -87.654467, home_runs: 0},
						 "317" => {y1: 41.948171, x1: -87.654583, y2: 41.948097, x2: -87.654462, home_runs: 0},
						 "318" => {y1: 41.948093, x1: -87.654581, y2: 41.948036, x2: -87.654461, home_runs: 0},
						 "336" => {y1: 41.948885, x1: -87.654907, y2: 41.948893, x2: -87.654701, home_runs: 0},
						 "339" => {y1: 41.948825, x1: -87.654766, y2: 41.948842, x2: -87.654630, home_runs: 0},
						 "341" => {y1: 41.948788, x1: -87.654701, y2: 41.948798, x2: -87.654567, home_runs: 0},
						 "342" => {y1: 41.948733, x1: -87.654641, y2: 41.948736, x2: -87.654441, home_runs: 0},
						 }

sections.each do |number, coords|
	coords[:number] = number
	coords[:stadium_id] = wrigley.id
	coords[:x1] -= wrigley.home_plate_coord_lon
	coords[:x2] -= wrigley.home_plate_coord_lon
	coords[:y1] -= wrigley.home_plate_coord_lat
	coords[:y2] -= wrigley.home_plate_coord_lat
	Section.create!(coords)
end

# Stadium.create(name: "Wrigley Field", 
# 							home_plate_coord_lat: 41.947911,
# 						  home_plate_coord_lon: -87.655812,
# 						  rf_line_ccw_from_east: 5.4,
# 						  tracker_id: "2015_4737",
# 						  lat_feet: 364409.0,
# 						  lon_feet: 272032.0)

# wrigley_field = Stadium.new({name: "Wrigley Field", 
# 														home_plate_coord_lat: 41.947911,
# 													  home_plate_coord_lon: -87.655812,
# 													  rf_line_ccw_from_east: 5.4,
# 													  tracker_id: "2015_4737",
# 													  lat_feet: 364409.0,
# 													  lon_feet: 272032.0, 
# 													  sections: sections})
