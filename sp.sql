-- Crear las materias
SELECT materia from alumnos_raw GROUP BY materia;		-- obtengo materias en csv

INSERT INTO materias(materia) SELECT materia from alumnos_raw GROUP BY materia;		-- Insertar todas las materias

INSERT INTO alumnos(id, nombre) SELECT id, nombre from alumnos_raw GROUP BY id;		-- Insertar todos los alumnos
