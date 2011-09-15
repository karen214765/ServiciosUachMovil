class Directorio < ActiveRecord::Migration
  def self.up
	create_table :ua_directorio do |t|
		t.string :nombre
		t.string :telefono
		t.references :unidad_academica
	end
  end

  def self.down
	drop_table :ua_directorio
  end
end
