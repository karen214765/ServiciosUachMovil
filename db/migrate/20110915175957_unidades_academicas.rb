class UnidadesAcademicas < ActiveRecord::Migration
  def self.up
	create_table :unidades_academicas do |t|
		t.string :nombre
		t.string :clave
		t.string :siglas
		t.references :director
	end
  end

  def self.down
	drop_table :unidades_academicas
  end
end


