-- ============================================
-- CONSULTA 5
-- PRODUCTOS PUBLICADOS POR USUARIO
-- ============================================

SELECT
    u.nombre AS usuario,
    p.nombre AS producto,
    p.precio,
    COUNT(p.id_producto) AS total_productos
FROM usuario u
INNER JOIN producto p
    ON u.id_usuario = p.id_usuario
GROUP BY
    u.nombre,
    p.nombre,
    p.precio
HAVING COUNT(p.id_producto) >= 1
ORDER BY p.precio DESC;