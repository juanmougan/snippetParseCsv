require 'csv'
require 'pp'
require 'set'

class ReducedStudent
  attr_accessor :id, :subject

	def initialize(id, name, subject)
		@id = id
		@name = name
		@subject = subject
	end

	def to_s
		"id: #{@id}	name: #{name}	subject:#{subject}"
	end
end 

rawStudents = []
CSV.foreach(File.path("inputReducido.csv"), {:headers => true}) do |col|
    # Where col corresponds to a zero-based value/column in the csv
    rawStudents << ReducedStudent.new(col[0], col[1], col[2])
end

puts 'El array raw es: '
pp rawStudents

filteredList = rawStudents.group_by{ |st| st.id  }
puts 'La lista filtrada es: '
pp filteredList

puts '-----------------------'
puts 'Aca empieza la magia del hash'
# Esto es para un solo Student. Tengo que replicarlo a varios
studentOneSubjects = Set.new
#studentOneSubjects = filteredList.map { 
#  |aSubject| aSubject = filteredList aSubject[:id].subject
#}
filteredList.map {
  |key, value| # para cada key (es un ID de Student), traerme las materias. Ponerlas en un Set para no duplicar.
  
  # con este each hago el "para todos"
  #value.each {
  #  |studentRow|
  #}
  
}

# esta es la verion harcodeada de "uno solo"
unaMateriaCualunque = filteredList["1"].at(0).subject
pp unaMateriaCualunque

#pp studentOneSubjects
