-- ===================================================
-- MANIPULACION DE DATOS JSONB EN LA TABLA PERFIL
-- ===================================================

-- ============================================
-- 1. AGREGAR NUEVO CAMPO JSONB
-- ============================================

ALTER TABLE perfil
ADD COLUMN informacion_bigdata JSONB;

-- ============================================
-- 2. INSERTAR INFORMACION JSONB
-- ============================================

UPDATE perfil
SET informacion_bigdata =
'{
    "dispositivos_iot": [
        "Sensor Temperatura",
        "Camara Inteligente",
        "Sensor Movimiento"
    ],
    "estadisticas": {
        "eventos_creados": 5,
        "servicios_publicados": 3,
        "nivel_actividad": "Alta"
    },
    "bigdata": true
}'::jsonb
WHERE id_perfil = 1;

-- ============================================
-- 3. CONSULTAR INFORMACION JSONB
-- ============================================

SELECT
    id_perfil,
    informacion_bigdata
FROM perfil;

-- ============================================
-- 4. ACTUALIZAR INFORMACION JSONB
-- ============================================

UPDATE perfil
SET informacion_bigdata =
'{
    "dispositivos_iot": [
        "Sensor Temperatura",
        "Camara Inteligente",
        "Sensor Movimiento",
        "Control Acceso"
    ],
    "estadisticas": {
        "eventos_creados": 8,
        "servicios_publicados": 6,
        "nivel_actividad": "Muy Alta"
    },
    "bigdata": true
}'::jsonb
WHERE id_perfil = 1;

-- ============================================
-- 5. ELIMINAR INFORMACION JSONB
-- ============================================

UPDATE perfil
SET informacion_bigdata = NULL
WHERE id_perfil = 1;

-- ============================================
-- 6. CONSULTA FINAL
-- ============================================

SELECT
    id_perfil,
    informacion_bigdata
FROM perfil;