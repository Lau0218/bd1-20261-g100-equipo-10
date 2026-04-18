-- eliminar tabla hija primero
DROP TABLE IF EXISTS habilidad_usuario;

-- eliminar tabla usuario (si quieres empezar limpio)
DROP TABLE IF EXISTS usuario;

-- eliminar tabla rol
DROP TABLE IF EXISTS rol;

-- JSONB
ALTER TABLE usuario 
ADD COLUMN perfil_extendido JSONB;

-- insertar rol si no existe
INSERT INTO rol (nombre_rol)
VALUES ('estudiante');

-- insertar usuario con JSON
INSERT INTO usuario (nombre, correo, contrasena, fecha_registro, id_rol, perfil_extendido)
VALUES (
    'Laura',
    'laura.cadena998@pascualbravo.edu.co',
    '123456',
    '2026-04-16',
    1,
    '{
        "intereses": ["programación", "bases de datos"]
    }'
);

-- tabla estructurada nueva
CREATE TABLE habilidad_usuario (
    id_habilidad SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    nivel VARCHAR(50),
    id_usuario INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- insertar dato estructurado
INSERT INTO habilidad_usuario (nombre, nivel, id_usuario)
VALUES ('Java', 'Intermedio', 1);



select * from usuario;
