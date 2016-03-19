class CreateStadia < ActiveRecord::Migration
  def change
  	create_table :stadia do |t|
  		t.string :name
  		t.float :home_plate_coord_lat
  		t.float :home_plate_coord_lon
  		t.float :rf_line_ccw_from_east
  		t.string :tracker_id
  		t.float :lat_feet
  		t.float :lon_feet
  		t.references :section
  	end
  end
end



