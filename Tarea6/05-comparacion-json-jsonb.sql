-- =====================================================
-- COMPARACION ENTRE JSON Y JSONB
-- =====================================================

-- ============================================
-- INSERCION EN CAMPO JSON
-- ============================================

EXPLAIN ANALYZE
UPDATE perfil
SET informacion_extra =
'{
    "habilidades": ["SQL", "Python", "Power BI"],
    "bigdata": true,
    "iot": true
}'
WHERE id_perfil = 1;

-- ============================================
-- LECTURA EN CAMPO JSON
-- ============================================

EXPLAIN ANALYZE
SELECT
    informacion_extra
FROM perfil
WHERE id_perfil = 1;

-- ============================================
-- INSERCION EN CAMPO JSONB
-- ============================================

EXPLAIN ANALYZE
UPDATE perfil
SET informacion_bigdata =
'{
    "habilidades": ["SQL", "Python", "Power BI"],
    "bigdata": true,
    "iot": true
}'::jsonb
WHERE id_perfil = 1;

-- ============================================
-- LECTURA EN CAMPO JSONB
-- ============================================

EXPLAIN ANALYZE
SELECT
    informacion_bigdata
FROM perfil
WHERE id_perfil = 1;