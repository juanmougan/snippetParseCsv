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

class Student
  attr_accessor :id, :first_name, :last_name, :file_number, :career, :subjects

  def initialize(id, first_name, last_name, file_number, career, subjects)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @file_number = file_number
    @career = career 
    @subjects = subjects
  end
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


studentsHash = Hash.new

filteredList.map do |key, value| 
  puts "Elemento[#{key}]: "
  pp value
  # para cada key (es un ID de Student), traerme las materias. Ponerlas en un Set para no duplicar.
  # Each key represents a Student id
  allSubjects = filteredList[key].collect {
    |row| Subject.new(row.subject_name, row.subject_code, row.career)
  }
  
  # Usando un Hash...
  subjectsForThisStudent = Set.new
  subjectsForThisStudent.add(allSubjects)
  
  # id, first_name, last_name, file_number, career, subject
  # Asumo que los datos del Student están TODOS duplicados
  first_name = value[0].first_name
  last_name = value[0].last_name
  file_number = value[0].file_number
  studentsHash[key] = Student.new(key, first_name, last_name, file_number, nil, subjectsForThisStudent)
  
end

puts "\n\n\Hash de alumnos: "
pp studentsHash
