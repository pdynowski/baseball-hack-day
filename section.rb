class Section

	attr_reader :home_runs

	def initialize(coords = {})
		@x1 = coords.fetch(:x1,0)
		@x2 = coords.fetch(:x2,0)
		@y1 = coords.fetch(:y1,0)
		@y2 = coords.fetch(:y2,0)
		@home_runs = 0
		color = "#ffffff"
	end

	def in_section?(homer={})
		ns_coord = homer.fetch(:ns_coord)
		ew_coord = homer.fetch(:ew_coord)
		if ok_ns?(ns_coord) && ok_ew?(ew_coord)
			add_homer
			return true
		end
		false
	end

	def ok_ns?(coord)
		p coord
		if (coord <= @y1 && coord >= @y2) || (coord <= @y2 && coord >= @y1)
			return true
		end
		false
	end

	def ok_ew?(coord)
		p coord
		if (coord <= @x1 && coord >= @x2) || (coord <= @x2 && coord >= @x1)
			return true
		end
		false
	end

	def add_homer
		home_runs += 1
	end

	def to_s
		"home_runs: #{home_runs}"
	end

end