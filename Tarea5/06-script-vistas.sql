-- ============================================
-- CREACION DE LA VISTA
-- ============================================

CREATE OR REPLACE VIEW vista_eventos_red_social AS

SELECT
e.id_evento,
e.titulo AS evento,
e.fecha_evento,

u.id_usuario,
u.nombre AS usuario_creador,

g.nombre AS grupo_social,

p.programa_academico

FROM evento e

INNER JOIN usuario u
ON e.id_usuario = u.id_usuario

INNER JOIN grupo_usuarios gu
ON u.id_usuario = gu.id_usuario

INNER JOIN grupo_social g
ON gu.id_grupo = g.id_grupo

INNER JOIN perfil p
ON u.id_usuario = p.id_usuario;


-- ============================================
-- CONSULTA SOBRE LA VISTA
-- ============================================

SELECT
id_evento,
evento,
fecha_evento,
usuario_creador,
grupo_social,
programa_academico

FROM vista_eventos_red_social

WHERE fecha_evento >= CURRENT_DATE - INTERVAL '3 MONTH'

ORDER BY fecha_evento DESC;