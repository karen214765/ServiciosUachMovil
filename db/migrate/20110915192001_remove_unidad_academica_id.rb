class RemoveUnidadAcademicaId < ActiveRecord::Migration
  def self.up
	remove_column :director, :unidad_academica_id
  end

  def self.down
  end
end
