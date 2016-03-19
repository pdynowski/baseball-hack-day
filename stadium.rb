require_relative 'section'
require 'yabo_tracker'

class Stadium

	attr_reader :outfield_sections, :home_plate_coord_lat, :home_plate_coord_lon
	attr_reader :rf_line_ccw_from_east

	def initialize(park_info={})
		@name = park_info.fetch(:name, "unknown")
		@home_plate_coord_lat = park_info.fetch(:home_plate_coord_lat, 0)
		@home_plate_coord_lon = park_info.fetch(:home_plate_coord_lon, 0)
		@rf_line_ccw_from_east = park_info.fetch(:rf_line_ccw_from_east, 0)
		@lon_feet = park_info.fetch(:lon_feet, 0)
		@lat_feet = park_info.fetch(:lat_feet, 0)
		@tracker_id = park_info.fetch(:tracker_id, 0)
		@outfield_sections = {}
		park_info.fetch(:sections).each do |section|
			add_section(section)
		end
		@home_runs = Homerun.homers_for_id(@tracker_id)
		place_homers
	end

	def add_section(section_info={})
		sec_coords = section_info[1]
		@outfield_sections[section_info[0]] =
						Section.new({x1: sec_coords[:x1] - @home_plate_coord_lon,
							y1: sec_coords[:y1] - @home_plate_coord_lat,
							x2: sec_coords[:x2] - @home_plate_coord_lon,
							y2: sec_coords[:y2] - @home_plate_coord_lat})
	end

	def place_homers
		@home_runs.each do |homer|
			# puts "Iterating over homers"
			# puts homer.true_distance
			# puts homer.horizontal_angle
			puts ns_coord(homer)
			puts ew_coord(homer)
			@outfield_sections.each do |section|
				# puts "Iterating over sections"
				p section[1]
				if(section[1].in_section?({ns_coord: ns_coord(homer),
						ew_coord: ew_coord(homer)}))
					break
				end
			end
		end
	end

	def calc_angle(homer)
		(homer.horizontal_angle + @rf_line_ccw_from_east - 45) * Math::PI/180
	end

	def ns_coord(homer)
		(homer.true_distance * Math.sin(calc_angle(homer)))/@lat_feet
	end

	def ew_coord(homer)
		p 
		(homer.true_distance * Math.cos(calc_angle(homer)))/@lon_feet
	end

end