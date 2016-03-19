class Section < ActiveRecord::Base

	belongs_to :stadium
 # attr_reader :home_runs

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
		if (coord <= y1 && coord >= y2) || (coord <= y2 && coord >= y1)
			return true
		end
		false
	end

	def ok_ew?(coord)
		if (coord <= x1 && coord >= x2) || (coord <= x2 && coord >= x1)
			return true
		end
		false
	end

	def add_homer
		self.home_runs += 1
		self.save
	end

	def to_s
		"section: #{number}  - home_runs: #{home_runs.inspect}"
	end

end
