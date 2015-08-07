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

var subjects = [];
subjects = studentsArray.map(mapCallback).reduce(reduceCallback, []);
console.log(subjects);

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
    
    // Solo devuelvo la materia, reduce() deberia agregarla a la lista
    return currentValue[2];
    
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
    console.log("Current value: " + currentValue);

    return subjects.push(currentValue);
}
