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
    "id: #{@id}  name: #{name}  subject:#{subject}"
  end
end

# TODO move this utility method elsewhere
# Since the hash has keys starting from "1", this methods returns an Integer
# substracting 1 to the key, so it returns a number starting from 0, which
# can be used as an Array index
def getUnshiftedKeyForArray(key)
  Integer(key) - 1
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

subjectsForEachStudent = Array.new(filteredList.length) { Set.new }
pp subjectsForEachStudent
filteredList.map do |key, value| 
  # para cada key (es un ID de Student), traerme las materias. Ponerlas en un Set para no duplicar.
  # Each key represents a Student id
  allSubjects = filteredList[key].collect {
    |row| row.subject
  }
  subjectsForEachStudent.at(getUnshiftedKeyForArray(key)).add(allSubjects)
  
end

puts 'Resultado: '
pp subjectsForEachStudent
