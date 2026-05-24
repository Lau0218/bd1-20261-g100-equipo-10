-- ============================================
-- PROPIEDAD ACID - ATOMICIDAD
-- ============================================

SELECT * FROM usuario WHERE id_usuario = 1;
SELECT * FROM producto WHERE id_producto = 1;

BEGIN;

UPDATE usuario
SET nombre = 'Usuario Temporal'
WHERE id_usuario = 1;

UPDATE producto
SET precio = 999999
WHERE id_producto = 1;

ROLLBACK;

SELECT * FROM usuario WHERE id_usuario = 1;
SELECT * FROM producto WHERE id_producto = 1;

-- ============================================
-- PROPIEDAD ACID - CONSISTENCIA
-- ============================================

-- ERROR POR LLAVE DUPLICADA

INSERT INTO rol (id_rol, nombre)
VALUES (1, 'Administrador');


-- ERROR POR FOREIGN KEY

INSERT INTO usuario
(nombre, correo, contrasena, fecha_registro, id_rol, id_tipo_usuario)

VALUES
('Usuario Error',
'error@pascualina.edu.co',
'12345',
CURRENT_DATE,
999,
999);


-- ERROR POR ELIMINAR REGISTRO RELACIONADO

DELETE FROM usuario
WHERE id_usuario = 1;



-- ============================================
-- PROPIEDAD ACID - DURABILIDAD
-- ============================================

SELECT * FROM servicio WHERE id_servicio = 1;

BEGIN;

UPDATE servicio
SET precio = 250000
WHERE id_servicio = 1;

COMMIT;

SELECT * FROM servicio WHERE id_servicio = 1;