/*
	Parse an input CSV file to extract a Student's data
*/

var parse = require('csv-parse');		// Parser library
var fs = require('fs');					// To read from filesystem
// require('should');					// For assertions, check: https://www.npmjs.com/package/should

var fileString;
var studentsArray;

// Check parameters
if (process.argv.length < 3) {
	console.log("Usage: " + process.argv[1] + " <input-file-name.csv>");
	process.exit(1);
};
fs.readFile(process.argv[2], 'utf-8', readFileCallback);

/**
 * Callback for reading the file
 */
function readFileCallback(err, data) {
	if(err) {
		console.log("An error occurred trying to read file: " + err);
	}
	else {
		parse(data, {comment: '#'}, parseFileCallback);
	}
}

/**
 * Callback for parsing the file content
 */
function parseFileCallback(err, output) {
	if(err) {
		console.log("An error occurred trying to parse file contents: " + err);
	}
	else {
		/*
		for (var i = 0; i < output.length; i++) {
			console.log(output[i]);
		}
		*/
		
		/*
		output.forEach(function(student) {
			console.log(student);
		});
		*/
		console.log(output);

	}
}
