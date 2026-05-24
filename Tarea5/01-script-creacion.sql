-- =========================================
-- TABLAS INDEPENDIENTES
-- =========================================

CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE tipo_usuario (
    id_tipo_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE grupo_social (
    id_grupo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- =========================================
-- TABLA USUARIO
-- =========================================

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_registro DATE,
    id_rol INT,
    id_tipo_usuario INT,

    CONSTRAINT fk_usuario_rol
    FOREIGN KEY (id_rol)
    REFERENCES rol(id_rol),

    CONSTRAINT fk_usuario_tipo
    FOREIGN KEY (id_tipo_usuario)
    REFERENCES tipo_usuario(id_tipo_usuario)
);

-- =========================================
-- PERFIL
-- =========================================

CREATE TABLE perfil (
    id_perfil SERIAL PRIMARY KEY,
    id_usuario INT UNIQUE,
    programa_academico VARCHAR(100),
    habilidades JSONB,
    intereses JSONB,

    CONSTRAINT fk_perfil_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);

-- =========================================
-- PUBLICACION
-- =========================================

CREATE TABLE publicacion (
    id_publicacion SERIAL PRIMARY KEY,
    id_usuario INT,
    contenido TEXT,
    fecha_publicacion TIMESTAMP,

    CONSTRAINT fk_publicacion_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);

-- =========================================
-- COMENTARIO
-- =========================================

CREATE TABLE comentario (
    id_comentario SERIAL PRIMARY KEY,
    id_publicacion INT,
    id_usuario INT,
    contenido TEXT,

    CONSTRAINT fk_comentario_publicacion
    FOREIGN KEY (id_publicacion)
    REFERENCES publicacion(id_publicacion),

    CONSTRAINT fk_comentario_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);

-- =========================================
-- SERVICIO
-- =========================================

CREATE TABLE servicio (
    id_servicio SERIAL PRIMARY KEY,
    id_usuario INT,
    titulo VARCHAR(100),
    precio DECIMAL(10,2),

    CONSTRAINT fk_servicio_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);

-- =========================================
-- PRODUCTO
-- =========================================

CREATE TABLE producto (
    id_producto SERIAL PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),

    CONSTRAINT fk_producto_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);

-- =========================================
-- EVENTO
-- =========================================

CREATE TABLE evento (
    id_evento SERIAL PRIMARY KEY,
    id_usuario INT,
    titulo VARCHAR(100),
    fecha_evento DATE,

    CONSTRAINT fk_evento_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);

-- =========================================
-- TABLAS PUENTE
-- =========================================

CREATE TABLE grupo_usuarios (
    id_grupo_usuario SERIAL PRIMARY KEY,
    id_usuario INT,
    id_grupo INT,

    CONSTRAINT fk_grupo_usuario_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario),

    CONSTRAINT fk_grupo_usuario_grupo
    FOREIGN KEY (id_grupo)
    REFERENCES grupo_social(id_grupo)
);

CREATE TABLE usuario_habilidad (
    id_usuario_habilidad SERIAL PRIMARY KEY,
    id_usuario INT,
    habilidad VARCHAR(100),

    CONSTRAINT fk_usuario_habilidad_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
);