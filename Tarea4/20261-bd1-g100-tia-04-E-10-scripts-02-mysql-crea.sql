CREATE DATABASE prueba_bd;
USE prueba_bd;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    correo VARCHAR(100)
);

CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE publicacion (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT,
    fecha_publicacion DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT,
    fecha DATE,
    id_usuario INT,
    id_publicacion INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion)
);

CREATE TABLE reaccion (
    id_reaccion INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    id_usuario INT,
    id_publicacion INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion)
);

CREATE TABLE mensaje (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT,
    fecha DATE,
    id_emisor INT,
    id_receptor INT,
    FOREIGN KEY (id_emisor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_receptor) REFERENCES usuario(id_usuario)
);

CREATE TABLE evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE miembro_grupo (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_grupo INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE notificacion (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    fecha DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reporte (
    id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    motivo TEXT,
    fecha_reporte DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE habilidad_usuario (
    id_habilidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nivel VARCHAR(50),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

