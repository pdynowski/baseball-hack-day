class CreateSections < ActiveRecord::Migration
  def change
  	create_table :sections do |t|
  		t.string :number
	  	t.float :x1
	  	t.float :y1
	  	t.float :x2
	  	t.float :y2
	  	t.integer :home_runs
	  	t.references :stadium
	  end
  end
end
