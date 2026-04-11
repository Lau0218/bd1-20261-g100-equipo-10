-- Modificación de Tablas

-- 1.1.- Agregar un campo a la tabla de usuarios de la red social
ALTER TABLE usuario 
ADD COLUMN telefono VARCHAR(20);       

-- 1.2.- Modificar un campo de la tabla de usuarios
 ALTER TABLE usuario 
ALTER COLUMN nombre TYPE VARCHAR(150);



--
-- Gestionar una tabla "nueva"
-- 1.- "agregar" una nueva tabla a la base de datos que tenga relación con el sistema
-- 2.- Darle un nombre "coherente"
-- 3.- Agregar campos coherentes con la tabla
-- 4.- Realizar todas las operaciones que se solicitan a continuación
--


-- 1.3.1
-- Crear una tabla "nueva" de su iniciativa (una tabla coherente con el sistema con su nombre, no coloque "nueva" como nombre)
CREATE TABLE seguimiento (
    id_seguimiento SERIAL PRIMARY KEY
);


-- 1.3.2
-- Agregar una clave primaria y otros 3 campos cualquiera a la tabla "nueva"
-- Mínimo un campo tipo texto y uno numérico
ALTER TABLE seguimiento 
ADD COLUMN descripcion VARCHAR(100);

ALTER TABLE seguimiento 
ADD COLUMN cantidad INTEGER;

ALTER TABLE seguimiento 
ADD COLUMN id_usuario INTEGER;




-- 1.3.3
-- Quitar uno de los campos de la tabla "nueva"
ALTER TABLE seguimiento 
DROP COLUMN cantidad;



-- 1.3.4
-- Cambiar el nombre de la tabla "nueva" a otro nombre "otro_nombre"
-- Todas las operaciones siguientes se realizan sobre la tabla renombrada
ALTER TABLE seguimiento 
RENAME TO seguimiento_usuario;


-- 1.3.5 
-- Agregar un campo único a la tabla 
ALTER TABLE seguimiento_usuario 
ADD CONSTRAINT unique_descripcion UNIQUE (descripcion);



-- 1.3.6
-- Agregar 2 fechas de inicio y fin; y colocar un control de orden de fechas 
ALTER TABLE seguimiento_usuario 
ADD COLUMN fecha_inicio DATE;

ALTER TABLE seguimiento_usuario 
ADD COLUMN fecha_fin DATE;

ALTER TABLE seguimiento_usuario 
ADD CONSTRAINT check_fechas CHECK (fecha_fin >= fecha_inicio);
 

-- 1.3.7
-- Agregar 1 campo entero y colocar un control para que no sea negativo
ALTER TABLE seguimiento_usuario 
ADD COLUMN cantidad INTEGER;

ALTER TABLE seguimiento_usuario 
ADD CONSTRAINT check_cantidad CHECK (cantidad >= 0);


-- 1.3.8
-- Modificar el tamaño de un campo texto de la tabla renombra
ALTER TABLE seguimiento_usuario 
ALTER COLUMN descripcion TYPE VARCHAR(200);


-- 1.3.7
-- Modificar el campo numeríco y colocar un control de rango 
ALTER TABLE seguimiento_usuario 
ADD CONSTRAINT check_rango CHECK (cantidad BETWEEN 0 AND 1000);



-- 1.3.8
-- Agregar un índice a la tabla (cualquier campo)
CREATE INDEX idx_descripcion 
ON seguimiento_usuario (descripcion);


-- 1.3.9 
-- Eliminar una de las fechas 
ALTER TABLE seguimiento_usuario 
DROP COLUMN fecha_fin;


-- 1.3.10
-- Borrar todos los datos de una tabla sin dejar traza
TRUNCATE TABLE seguimiento_usuario;
