-- =========================================
-- CREACION TABLA USUARIO_TEST
-- =========================================

CREATE TABLE IF NOT EXISTS usuario_test (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    datos_salud JSONB
);

-- =========================================
-- SIMULACION 1 - 1.000 REGISTROS
-- =========================================
EXPLAIN ANALYZE
INSERT INTO usuario_test(nombre, correo, datos_salud)
SELECT
    'Usuario_' || generate_series,
    'correo' || generate_series || '@mail.com',

    jsonb_build_object(
        'presion_sanguinea', '120/80',
        'temperatura', 36.5,
        'grupo_sanguineo', 'O+',
        'nivel_azucar', 90,
        'fecha_medicion', NOW()
    )

FROM generate_series(1,1000);

-- CONSULTA LECTURA

EXPLAIN ANALYZE
SELECT *
FROM usuario_test
WHERE datos_salud ->> 'grupo_sanguineo' = 'O+';

-- TAMAÑO TABLA

SELECT ROUND(
    pg_total_relation_size('usuario_test') / 1024.0 / 1024.0,
2) AS tamano_mb;

-- LIMPIEZA

TRUNCATE TABLE usuario_test;

-- =========================================
-- SIMULACION 2 - 10.000 REGISTROS
-- =========================================

EXPLAIN ANALYZE
INSERT INTO usuario_test(nombre, correo, datos_salud)
SELECT
    'Usuario_' || generate_series,
    'correo' || generate_series || '@mail.com',

    jsonb_build_object(
        'presion_sanguinea', '120/80',
        'temperatura', 36.5,
        'grupo_sanguineo', 'A+',
        'nivel_azucar', 95,
        'fecha_medicion', NOW()
    )

FROM generate_series(1,10000);

EXPLAIN ANALYZE
SELECT *
FROM usuario_test
WHERE datos_salud ->> 'grupo_sanguineo' = 'A+';

SELECT ROUND(
    pg_total_relation_size('usuario_test') / 1024.0 / 1024.0,
2) AS tamano_mb;

TRUNCATE TABLE usuario_test;

-- =========================================
-- SIMULACION 3 - 100.000 REGISTROS
-- =========================================

EXPLAIN ANALYZE
INSERT INTO usuario_test(nombre, correo, datos_salud)
SELECT
    'Usuario_' || generate_series,
    'correo' || generate_series || '@mail.com',

    jsonb_build_object(
        'presion_sanguinea', '110/70',
        'temperatura', 37.0,
        'grupo_sanguineo', 'B+',
        'nivel_azucar', 100,
        'fecha_medicion', NOW()
    )

FROM generate_series(1,100000);

EXPLAIN ANALYZE
SELECT *
FROM usuario_test
WHERE datos_salud ->> 'grupo_sanguineo' = 'B+';

SELECT ROUND(
    pg_total_relation_size('usuario_test') / 1024.0 / 1024.0,
2) AS tamano_mb;

TRUNCATE TABLE usuario_test;