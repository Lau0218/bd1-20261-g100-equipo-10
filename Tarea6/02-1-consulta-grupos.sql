SELECT
    g.id_grupo,
    g.nombre AS grupo_social,
    COUNT(gu.id_usuario) AS cantidad_miembros
FROM grupo_social g
INNER JOIN grupo_usuarios gu
    ON g.id_grupo = gu.id_grupo
GROUP BY
    g.id_grupo,
    g.nombre
HAVING COUNT(gu.id_usuario) >= 1
ORDER BY g.nombre ASC;