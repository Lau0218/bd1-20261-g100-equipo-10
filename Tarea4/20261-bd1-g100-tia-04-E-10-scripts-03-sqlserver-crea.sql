CREATE DATABASE red_social;
GO

USE red_social;
GO

CREATE TABLE rol (
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE
);

CREATE TABLE usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(150),
    correo VARCHAR(100),
    contrasena VARCHAR(100),
    fecha_registro DATE,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE publicacion (
    id_publicacion INT IDENTITY(1,1) PRIMARY KEY,
    contenido TEXT,
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


CREATE TABLE comentario (
    id_comentario INT IDENTITY(1,1) PRIMARY KEY,
    contenido TEXT,
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reaccion (
    id_reaccion INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(50),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE mensaje (
    id_mensaje INT IDENTITY(1,1) PRIMARY KEY,
    contenido TEXT,
    fecha DATE,
    id_usuario_emisor INT,
    id_usuario_receptor INT
);


CREATE TABLE evento (
    id_evento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE oferta_laboral (
    id_oferta INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion TEXT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reporte (
    id_reporte INT IDENTITY(1,1) PRIMARY KEY,
    motivo TEXT,
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE notificacion (
    id_notificacion INT IDENTITY(1,1) PRIMARY KEY,
    mensaje TEXT,
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


CREATE TABLE habilidad_usuario (
    id_habilidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    nivel VARCHAR(50),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);