-- =========================================
-- INSERCION Y ELIMINACION DE PRODUCTO
-- =========================================

INSERT INTO producto
(id_usuario, nombre, precio)
VALUES
(1, 'Producto Temporal', 50000);

DELETE FROM producto
WHERE nombre = 'Producto Temporal';

-- =========================================
-- INSERCION Y ELIMINACION DE EVENTO
-- =========================================

INSERT INTO evento
(id_usuario, titulo, fecha_evento)
VALUES
(1, 'Evento Cancelado', CURRENT_DATE);

DELETE FROM evento
WHERE titulo = 'Evento Cancelado';

-- =========================================
-- INSERCION Y ELIMINACION DE SERVICIO
-- =========================================

INSERT INTO servicio
(id_usuario, titulo, precio)
VALUES
(2, 'Servicio Temporal', 30000);

DELETE FROM servicio
WHERE titulo = 'Servicio Temporal';