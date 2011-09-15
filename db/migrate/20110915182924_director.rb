class Director < ActiveRecord::Migration
  def self.up
	create_table :director do |t|
		t.string :nombre
		t.string :telefono
		t.string :extension
		t.references :unidad_academica
	end
  end

  def self.down
	drop_table :director
  end
end
