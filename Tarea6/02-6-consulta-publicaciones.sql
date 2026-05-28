-- ============================================
-- CONSULTA 6
-- PUBLICACIONES Y CANTIDAD DE COMENTARIOS
-- ============================================

SELECT
    p.id_publicacion,
    p.contenido,
    u.nombre AS autor,
    COUNT(c.id_comentario) AS total_comentarios
FROM publicacion p
INNER JOIN usuario u
    ON p.id_usuario = u.id_usuario
INNER JOIN comentario c
    ON p.id_publicacion = c.id_publicacion
GROUP BY
    p.id_publicacion,
    p.contenido,
    u.nombre
HAVING COUNT(c.id_comentario) >= 1
ORDER BY total_comentarios DESC;