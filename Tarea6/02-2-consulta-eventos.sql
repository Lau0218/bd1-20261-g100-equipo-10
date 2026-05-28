-- ============================================
-- CONSULTA 2
-- EVENTOS Y CANTIDAD DE USUARIOS
-- ============================================

SELECT
    e.id_evento,
    e.titulo AS evento,
    u.nombre AS usuario_promotor,
    e.fecha_evento,
    COUNT(e.id_usuario) AS cantidad_registros
FROM evento e
INNER JOIN usuario u
    ON e.id_usuario = u.id_usuario
GROUP BY
    e.id_evento,
    e.titulo,
    u.nombre,
    e.fecha_evento
HAVING COUNT(e.id_usuario) >= 1
ORDER BY e.fecha_evento DESC;