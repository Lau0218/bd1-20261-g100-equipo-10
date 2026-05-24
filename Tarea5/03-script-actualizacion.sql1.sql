-- =========================================
-- ACTUALIZACION DE USUARIOS
-- =========================================

UPDATE usuario
SET nombre = 'Laura Cadena Martinez'
WHERE id_usuario = 1;

UPDATE usuario
SET nombre = 'Carlos Ramirez Gomez'
WHERE id_usuario = 2;

-- =========================================
-- ACTUALIZACION DE PRODUCTOS
-- =========================================

UPDATE producto
SET precio = 150000
WHERE id_producto = 1;

UPDATE producto
SET precio = 120000
WHERE id_producto = 2;

UPDATE producto
SET precio = 95000
WHERE id_producto = 3;

-- =========================================
-- ACTUALIZACION DE EVENTOS
-- =========================================

UPDATE evento
SET fecha_evento = '2026-06-15'
WHERE id_evento = 1;

UPDATE evento
SET fecha_evento = '2026-07-10'
WHERE id_evento = 2;