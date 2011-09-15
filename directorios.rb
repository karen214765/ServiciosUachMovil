require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'



	ActiveRecord::Base.establish_connection(:adapter => 'postgresql', :encoding => 'utf8', :database => 'directorio', :host => 'localhost', :port => '5432', :pool => '5', :username => 'pd', :password => 'tron9000' )


class UnidadAcademica < ActiveRecord::Base
	set_table_name :unidades_academicas
	has_one :director, :class_name => 'Director', :foreign_key => 'id'
	has_many :telefonos, :class_name => 'Directorio', :foreign_key => 'unidad_academica_id'
end
class Director < ActiveRecord::Base
	set_table_name :director
end

class Directorio < ActiveRecord::Base
	set_table_name :ua_directorio
	belongs_to :unidad_academica
end

get '/unidades_academicas.xml', :provides => 'xml' do
	unidades = UnidadAcademica.all
	puts unidades.first.director.nombre
end

get '/unidades_academicas/:id.xml', :provides => 'xml' do
	unidad = UnidadAcademica.find(params[:id])
	telefonos = unidad.telefonos
	telefonos.to_xml
end

get '/unidades_academicas/:id.json', :provides => 'json' do
	unidad = UnidadAcademica.find(params[:id])
	unidad.to_json
end
