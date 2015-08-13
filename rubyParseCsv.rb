require 'csv'
require 'pp'
require 'set'

class Career
  attr_accessor :id, :name

  def initialize(name)
    @name = name
  end
end

class Subject
  attr_accessor :id, :name, :code, :career

  def initialize(name, code, career)
    @name = name
    @code = code
    @career = career
  end
end

class StudentRow
  attr_accessor :id, :first_name, :last_name, :file_number, :career, :subject_name, :subject_code

  def initialize(id, first_name, last_name, file_number, career, subject_name, subject_code)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @file_number = file_number
    @career = career 
    @subject_name = subject_name
    @subject_code = subject_code
  end
end

# FIXME deberia ser "Subjects", es una Collection
class Student
  attr_accessor :id, :first_name, :last_name, :file_number, :career, :subject

  def initialize(id, first_name, last_name, file_number, career, subject)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @file_number = file_number
    @career = career 
    @subject = subject
  end
end

# TODO este metodo es una grasada que funciona porque los IDs del ejemplo son 1, 2, 3...
# Quizás subjectsForEachStudent debería ser un Hash de Sets, no un Array dce Sets
# Así indexo al Student por su ID
# TODO move this utility method elsewhere
# Since the hash has keys starting from "1", this methods returns an Integer
# substracting 1 to the key, so it returns a number starting from 0, which
# can be used as an Array index
def getUnshiftedKeyForArray(key)
  Integer(key) - 1
end 

rawStudentRows = []
CSV.foreach(File.path("input.csv"), {:headers => true}) do |col|
    # Where col corresponds to a zero-based value/column in the csv
    rawStudentRows << StudentRow.new(col[0], col[1], col[2], col[3], col[4], col[5], col[6])
end

#puts 'El array raw es: '
#pp rawStudentRows

filteredList = rawStudentRows.group_by{ |st| st.id  }
puts 'La lista filtrada es: '
pp filteredList

#puts '-----------------------'
#puts 'Aca empieza la magia del hash'

#subjectsForEachStudent = Array.new(filteredList.length) { Set.new }
#pp subjectsForEachStudent

subjectsForEachStudent = Hash.new

# Voy creando el Array de Alumnos
#studentsArray = Array.new(subjectsForEachStudent.length)

studentsHash = Hash.new

filteredList.map do |key, value| 
  puts "Elemento[#{key}]: "
  pp value
  # para cada key (es un ID de Student), traerme las materias. Ponerlas en un Set para no duplicar.
  # Each key represents a Student id
  allSubjects = filteredList[key].collect {
    |row| Subject.new(row.subject_name, row.subject_code, row.career)
  }
  
  # Tirar esto, no es un Array...
  # Con esto estoy ocupando casilleros del Array según si existe ese ID o no... una idea discutible
  # add() es porque ese objeto es un Set
  # subjectsForEachStudent.at(getUnshiftedKeyForArray(key)).add(allSubjects)
  
  # Usando un Hash...
  subjectsForEachStudent[key] = Set.new
  subjectsForEachStudent[key].add(allSubjects)
  
  # id, first_name, last_name, file_number, career, subject
  # Asumo que los datos del Student están TODOS duplicados
  # Creo al Student sin las Subjects, despues las agrego
  first_name = value[0].first_name
  last_name = value[0].last_name
  file_number = value[0].file_number
  studentsHash[key] = Student.new(key, first_name, last_name, file_number, nil, nil)
  
end

puts 'Resultado de recolectar todas las materias: '
pp subjectsForEachStudent

# Ahora le seteo a cada Student sus Subjects
studentsHash.map { |key, value| 
  value.subject = subjectsForEachStudent[key]   # Porque comparten la key...
}

puts "\n\n\Hash de alumnos: "
pp studentsHash
