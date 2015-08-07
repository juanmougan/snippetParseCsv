var mapreduce = require('mapred')();

var studentsArray = 
	[ [ 'id',
    'Nombre',
    'Apellido',
    'Nro. Reg.',
    'Carrera',
    'Materia',
    'Cod. Mat.' ],
  [ '1',
    'Mariana',
    'González',
    '12345678',
    'Informática',
    'Álgebra y Geometría',
    '101' ],
  [ '1',
    'Mariana',
    'González',
    '12345678',
    'Informática',
    'Cálculo Elemental',
    '102' ],
  [ '1',
    'Mariana',
    'González',
    '12345678',
    'Informática',
    'Filosofía I',
    '103' ],
  [ '1',
    'Mariana',
    'González',
    '12345678',
    'Informática',
    'Informática I',
    '104' ],
  [ '2',
    'Carlos',
    'Pérez',
    '87654321',
    'Industrial',
    'Física II',
    '201' ],
  [ '2',
    'Carlos',
    'Pérez',
    '87654321',
    'Industrial',
    'Métodos Numéricos',
    '202' ],
  [ '2',
    'Carlos',
    'Pérez',
    '87654321',
    'Industrial',
    'Matemática Superior',
    '203' ],
  [ '2',
    'Carlos',
    'Pérez',
    '87654321',
    'Industrial',
    'Filosofía II',
    '204' ],
  [ '3',
    'Camila',
    'Giménez',
    '45679231',
    'Informática',
    'Programación I',
    '301' ],
  [ '3',
    'Camila',
    'Giménez',
    '45679231',
    'Informática',
    'Matemática Discreta',
    '302' ],
  [ '3',
    'Camila',
    'Giménez',
    '45679231',
    'Informática',
    'Teología I',
    '303' ],
  [ '3',
    'Camila',
    'Giménez',
    '45679231',
    'Informática',
    'Electrónica Digital',
    '304' ] ];

var map = function(key, value) {
	/*
    var list = [];
	list.push(key, value.toUpperCase());
	return list;
    */
    console.log("MAP----");
    console.log("key: " + key + "   value: " + value);
    return {
        id: key,            // Para el alumno "i"...
        materia: value        // devolver la materia
    };
}

var reduce = function(key, values) {
	/*
    var sum = 0;
    values.forEach(function(e){
        sum += e;
    });
    return sum;
    */
    console.log("REDUCE----");
    console.log("key: " + key + "   values: " + values);   
}

mapreduce(studentsArray, map, reduce, function(result){
    console.log(result);
});

// console.log(studentsArray);
