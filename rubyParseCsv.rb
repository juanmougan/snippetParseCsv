require 'csv'
require 'pp'
require 'set'

class ReducedStudent
	def initialize(id, name, subject)
		@id = id
		@name = name
		@subject = subject
	end

	def id
    	@id
  	end

  	def to_s
  		"id: #{@id}	name: #{name}	subject:#{subject}"
  	end
end 

rawStudents = []
CSV.foreach(File.path("inputReducido.csv")) do |col|
    # Where col corresponds to a zero-based value/column in the csv
    rawStudents << ReducedStudent.new(col[0], col[1], col[2])
end

puts 'El array raw es: '
pp rawStudents

filteredList = rawStudents.group_by{ |st| st.id  }
puts 'La lista filtrada es: '
pp filteredList

# Esto es para un solo Student. Tengo que replicarlo a varios
studentOneSubjects = Set.new
#studentOneSubjects = filteredList.map { 
#  |aSubject| aSubject = filteredList aSubject[:id].subject
#}
filteredList.map {
  |key, value| # para cada key (es un ID de Student), traerme las materias. Ponerlas en un Set para no duplicar.
}
#pp studentOneSubjects
