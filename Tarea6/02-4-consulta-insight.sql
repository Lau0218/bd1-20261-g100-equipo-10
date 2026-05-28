-- ============================================
-- CONSULTA 4
-- INSIGHT DE EVENTOS Y SERVICIOS
-- ============================================

SELECT
    u.nombre AS usuario,
    COUNT(DISTINCT e.id_evento) AS total_eventos,
    COUNT(DISTINCT s.id_servicio) AS total_servicios
FROM usuario u
INNER JOIN evento e
    ON u.id_usuario = e.id_usuario
INNER JOIN servicio s
    ON u.id_usuario = s.id_usuario
INNER JOIN perfil p
    ON u.id_usuario = p.id_usuario
WHERE e.fecha_evento >= '2026-01-01'
GROUP BY
    u.nombre
HAVING COUNT(DISTINCT e.id_evento) >= 1
ORDER BY total_eventos DESC;