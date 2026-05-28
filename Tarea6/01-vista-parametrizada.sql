-- ==========================================
-- CREACION DE LA VISTA
-- ==========================================

CREATE OR REPLACE VIEW vista_eventos_resumen AS
SELECT
    e.id_evento,
    e.titulo AS evento,
    e.fecha_evento,
    u.nombre AS usuario_creador,
    COUNT(e.id_evento) AS total_eventos
FROM evento e
INNER JOIN usuario u
    ON e.id_usuario = u.id_usuario
GROUP BY
    e.id_evento,
    e.titulo,
    e.fecha_evento,
    u.nombre;

-- ==========================================
-- CONSULTA PARAMETRIZADA
-- ==========================================

PREPARE consulta_eventos(date, integer) AS
SELECT
    evento,
    fecha_evento,
    usuario_creador,
    total_eventos
FROM vista_eventos_resumen
WHERE fecha_evento >= $1
AND total_eventos >= $2;

-- ==========================================
-- EJECUCIONES
-- ==========================================

EXECUTE consulta_eventos('2026-01-01', 1);

EXECUTE consulta_eventos('2026-06-01', 1);

EXECUTE consulta_eventos('2026-07-01', 1);
DEALLOCATE ALL;

PREPARE consulta_eventos(date, integer) AS
SELECT
    evento,
    fecha_evento,
    usuario_creador,
    total_eventos
FROM vista_eventos_resumen
WHERE fecha_evento >= $1
AND total_eventos >= $2;

EXECUTE consulta_eventos('2026-01-01', 1);

EXECUTE consulta_eventos('2026-06-01', 1);

EXECUTE consulta_eventos('2026-07-01', 1);

