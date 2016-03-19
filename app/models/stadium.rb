require 'yabo_tracker'

homers = 	Homerun.homers_for_id("2015_4737")

class Stadium < ActiveRecord::Base
  has_many :sections

  def add_section(section_info={})
		sec_coords = section_info[1]
		sections[section_info[0]] =
						Section.new({x1: sec_coords[:x1] - @home_plate_coord_lon,
							y1: sec_coords[:y1] - @home_plate_coord_lat,
							x2: sec_coords[:x2] - @home_plate_coord_lon,
							y2: sec_coords[:y2] - @home_plate_coord_lat})
	end

	def home_runs
		Homerun.homers_for_id("2015_4737")
	end

	def place_homers
		home_runs.each do |homer|
			sections.each do |section|
				if(section.in_section?({ns_coord: ns_coord(homer),
						ew_coord: ew_coord(homer)}))
					break
				end
			end
		end
	end

	def calc_angle(homer)
		(homer.horizontal_angle + rf_line_ccw_from_east - 45) * Math::PI/180
	end

	def ns_coord(homer)
		(homer.true_distance * Math.sin(calc_angle(homer)))/lat_feet
	end

	def ew_coord(homer)
		(homer.true_distance * Math.cos(calc_angle(homer)))/lon_feet
	end

end
