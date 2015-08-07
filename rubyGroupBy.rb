require 'pp'
class Student
	def initialize(id, subject)
		@id = id
		@subject = subject
	end

	def id
    	@id
  	end

  	def to_s
  		"id: #{@id}	subject:#{subject}"
  	end
end

juan = Student.new(1, "Algebra")
juan2 = Student.new(1, "Calculo")
maria = Student.new(2, "Algebra")

lista = Array.new()
lista.push(juan).push(juan2).push(maria)

listaFiltrada = lista.group_by{ |st| st.id  }
pp listaFiltrada
