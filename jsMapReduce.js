// Without mapred, just JavaScript

var studentsArray = 
	[
  [ '1', 'Mariana', 'Álgebra y Geometría' ],
  [ '1', 'Mariana', 'Cálculo Elemental' ],
  [ '1', 'Mariana', 'Filosofía I' ],
  [ '1', 'Mariana', 'Informática I' ],
  [ '2', 'Carlos', 'Física II' ],
  [ '2', 'Carlos', 'Métodos Numéricos' ],
  [ '2', 'Carlos', 'Matemática Superior' ],
  [ '2', 'Carlos', 'Filosofía II' ],
  [ '3', 'Camila', 'Programación I' ],
  [ '3', 'Camila', 'Matemática Discreta' ],
  [ '3', 'Camila', 'Teología I' ],
  [ '3', 'Camila', 'Electrónica Digital' ] ];

function Student(name, subjects) {
  this.name = name;
  this.subjects = subjects;
}

var students = [];
// students = studentsArray.map(mapCallback).reduce(reduceCallback, students);
students = studentsArray.map(mapCallback);
console.log(students);

/**
*   currentValue
*       The current element being processed in the array.
*   index
*       The index of the current element being processed in the array.
*   array
*       The array map was called upon.
*/
function mapCallback(currentValue, index, array) {
    
    console.log("Materia? " + currentValue[2]);
    console.log("MAP --- curr: " + currentValue + "\t\tIndex: " + index + "\t\tArray: " + array + "\n");
    
    // return array[index].push(currentValue[2]); // pusheo materia
    
    /*
    var parAlumnoMateria = new Map();
    parAlumnoMateria.set("id", currentValue[0]);
    parAlumnoMateria.set("materia", currentValue[2]);
    */

    /*
    var parAlumnoMateria;
    parAlumnoMateria["id"] = currentValue[0];
    parAlumnoMateria["materia"] = currentValue[2];
    return parAlumnoMateria;
    */

    // Devolver el Alumno y su materia actual
    return {
        id: currentValue[0],                    // Para el alumno "i"...
        subject: currentValue[2]
    };
    
    
    
    // TODO seguramente esto se pueda cambiar por lo de arriba
    /*
    var result = new Array();
    result[0] = currentValue[0];
    result[1] = currentValue[1];
    result[2] = currentValue[2];;
    return result;
    */
    
}

/**
*
*/

/**
*   previousValue
*       The value previously returned in the last invocation of the callback, or initialValue, if supplied. (See below.)
*   currentValue
*       The current element being processed in the array.
*   index
*       The index of the current element being processed in the array.
*   array
*       The array map was called upon.
*/
function reduceCallback(previousValue, currentValue, index, array) {
    // console.log("REDUCE --- previous: " + previousValue["id"] + " | " + previousValue["materia"] + "\t\tcurr: " + currentValue + "\t\tIndex: " + index + "\t\tArray: " + array + "\n");
    // console.log("REDUCE --- previous: " + previousValue + "\t\tcurr: " + currentValue + "\t\tIndex: " + index + "\t\tArray: " + array + "\n");
    // console.log("REDUCE --- previous: " + previousValue.get("id") + " | " + previousValue.get("materia") + "\t\tcurr: " + currentValue.get("id") + " | " + currentValue.get("materia") + "\t\tIndex: " + index + "\t\tArray: " + array + "\n");

    console.log(students);
    console.log("REDUCE--- current value: " + currentValue);
    return students.push(currentValue);
}
