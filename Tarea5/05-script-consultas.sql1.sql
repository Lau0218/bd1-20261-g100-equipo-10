-- ============================================
-- CONSULTA 1 - SIMPLE SIN JOIN
-- LISTAR TODOS LOS USUARIOS
-- ============================================

SELECT
id_usuario,
nombre,
correo,
fecha_registro
FROM usuario;


-- ============================================
-- CONSULTA 2 - 1 JOIN
-- LISTAR EVENTOS CON EL USUARIO QUE LOS CREÓ
-- ============================================

SELECT
u.nombre AS usuario,
e.id_evento,
e.titulo,
e.fecha_evento
FROM evento e
INNER JOIN usuario u
ON e.id_usuario = u.id_usuario
ORDER BY e.fecha_evento DESC;


-- ============================================
-- CONSULTA 3 - 2 JOIN
-- LISTAR GRUPOS Y SUS USUARIOS
-- ============================================

SELECT
g.nombre AS grupo,
u.nombre AS usuario,
u.correo
FROM grupo_social g
INNER JOIN grupo_usuarios gu
ON g.id_grupo = gu.id_grupo
INNER JOIN usuario u
ON gu.id_usuario = u.id_usuario;


-- ============================================
-- CONSULTA 4 - 3 JOIN
-- LISTAR COMENTARIOS DE PUBLICACIONES
-- ============================================

SELECT
u.nombre AS usuario,
p.contenido AS publicacion,
c.contenido AS comentario
FROM comentario c
INNER JOIN usuario u
ON c.id_usuario = u.id_usuario
INNER JOIN publicacion p
ON c.id_publicacion = p.id_publicacion
INNER JOIN perfil pe
ON pe.id_usuario = u.id_usuario;


-- ============================================
-- CONSULTA 5 - 4 JOIN
-- LISTAR HABILIDADES DE USUARIOS EN GRUPOS
-- ============================================

SELECT
u.nombre AS usuario,
g.nombre AS grupo,
uh.habilidad,
p.programa_academico
FROM usuario u
INNER JOIN usuario_habilidad uh
ON u.id_usuario = uh.id_usuario
INNER JOIN grupo_usuarios gu
ON u.id_usuario = gu.id_usuario
INNER JOIN grupo_social g
ON gu.id_grupo = g.id_grupo
INNER JOIN perfil p
ON u.id_usuario = p.id_usuario;


-- ============================================
-- CONSULTA 6 - INSIGHT CON 4 JOIN
-- LISTAR USUARIOS, EVENTOS Y SERVICIOS
-- ============================================

SELECT
u.nombre AS usuario,
e.titulo AS evento,
s.titulo AS servicio,
p.programa_academico
FROM usuario u
INNER JOIN evento e
ON u.id_usuario = e.id_usuario
INNER JOIN servicio s
ON u.id_usuario = s.id_usuario
INNER JOIN perfil p
ON u.id_usuario = p.id_usuario
INNER JOIN tipo_usuario tu
ON u.id_tipo_usuario = tu.id_tipo_usuario;