-- ===================================================
-- MANIPULACION DE DATOS JSON EN LA TABLA PERFIL
-- ===================================================

-- ============================================
-- 1. AGREGAR NUEVO CAMPO JSON
-- ============================================

ALTER TABLE perfil
ADD COLUMN informacion_extra JSON;

-- ============================================
-- 2. INSERTAR INFORMACION JSON
-- ============================================

UPDATE perfil
SET informacion_extra =
'{
    "habilidades": ["SQL", "PostgreSQL", "Python"],
    "nivel": "Intermedio",
    "intereses": {
        "bigdata": true,
        "iot": true,
        "backend": true
    }
}'
WHERE id_perfil = 1;

-- ============================================
-- 3. CONSULTAR INFORMACION JSON
-- ============================================

SELECT
    id_perfil,
    informacion_extra
FROM perfil;

-- ============================================
-- 4. ACTUALIZAR INFORMACION JSON
-- ============================================

UPDATE perfil
SET informacion_extra =
'{
    "habilidades": ["SQL", "PostgreSQL", "Python", "Power BI"],
    "nivel": "Avanzado",
    "intereses": {
        "bigdata": true,
        "iot": true,
        "backend": true,
        "analitica": true
    }
}'
WHERE id_perfil = 1;

-- ============================================
-- 5. ELIMINAR INFORMACION JSON
-- ============================================

UPDATE perfil
SET informacion_extra = NULL
WHERE id_perfil = 1;

-- ============================================
-- 6. CONSULTA FINAL
-- ============================================

SELECT
    id_perfil,
    informacion_extra
FROM perfil;