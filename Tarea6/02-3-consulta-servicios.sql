-- ============================================
-- CONSULTA 3
-- SERVICIOS Y CANTIDAD DE USUARIOS
-- ============================================

SELECT
    s.id_servicio,
    s.titulo AS servicio,
    COUNT(s.id_usuario) AS cantidad_usuarios
FROM servicio s
INNER JOIN usuario u
    ON s.id_usuario = u.id_usuario
GROUP BY
    s.id_servicio,
    s.titulo
HAVING COUNT(s.id_usuario) >= 1
ORDER BY cantidad_usuarios DESC;