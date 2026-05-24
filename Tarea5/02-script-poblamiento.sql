TRUNCATE TABLE
usuario_habilidad,
grupo_usuarios,
comentario,
publicacion,
evento,
producto,
servicio,
perfil,
usuario,
tipo_usuario,
rol
RESTART IDENTITY CASCADE;

-- =========================
-- TABLA ROL
-- =========================

INSERT INTO rol (nombre)
VALUES
('Administrador'),
('Moderador'),
('Estudiante'),
('Invitado');

-- =========================
-- TABLA TIPO_USUARIO
-- =========================

INSERT INTO tipo_usuario (nombre)
VALUES
('Pregrado'),
('Posgrado'),
('Docente'),
('Egresado'),
('Monitor'),
('Investigador'),
('Administrativo'),
('Aspirante'),
('Visitante');

-- =========================
-- TABLA USUARIO
-- =========================

INSERT INTO usuario
(nombre, correo, contrasena, fecha_registro, id_rol, id_tipo_usuario)
VALUES

('Laura Cadena', 'laura@pascualina.edu.co', '12345', CURRENT_DATE, 1, 1),

('Carlos Ramirez', 'carlos@pascualina.edu.co', '12345', CURRENT_DATE, 3, 2),

('Maria Lopez', 'maria@pascualina.edu.co', '12345', CURRENT_DATE, 3, 1),

('Andres Gomez', 'andres@pascualina.edu.co', '12345', CURRENT_DATE, 2, 4),

('Sofia Martinez', 'sofia@pascualina.edu.co', '12345', CURRENT_DATE, 3, 5);

-- =========================
-- TABLA PERFIL
-- =========================

INSERT INTO perfil
(id_usuario, programa_academico, habilidades, intereses)
VALUES

(1, 'Ingenieria Software',
'{"habilidades":["SQL","Python"]}',
'{"intereses":["IA","Backend"]}'),

(2, 'Diseño UX',
'{"habilidades":["Figma","Canva"]}',
'{"intereses":["UI","Marketing"]}');

-- =========================
-- TABLA PUBLICACION
-- =========================

INSERT INTO publicacion
(id_usuario, contenido, fecha_publicacion)
VALUES

(1, 'Aprendiendo PostgreSQL', CURRENT_TIMESTAMP),

(2, 'Busco equipo para proyecto UX', CURRENT_TIMESTAMP);

-- =========================
-- TABLA COMENTARIO
-- =========================

INSERT INTO comentario
(id_publicacion, id_usuario, contenido)
VALUES

(1, 2, 'Excelente aporte'),

(2, 1, 'Me interesa participar');

-- =========================
-- TABLA GRUPO_SOCIAL
-- =========================

INSERT INTO grupo_social
(nombre, descripcion)
VALUES

('Semillero IA', 'Grupo de inteligencia artificial'),

('Diseño Creativo', 'Grupo de diseño UI/UX');

-- =========================
-- TABLA GRUPO_USUARIOS
-- =========================

INSERT INTO grupo_usuarios
(id_usuario, id_grupo)
VALUES

(1,1),
(2,2),
(3,1);

-- =========================
-- TABLA SERVICIO
-- =========================

INSERT INTO servicio
(id_usuario, titulo, precio)
VALUES

(1, 'Clases SQL', 50000),

(2, 'Diseño Logos', 80000);

-- =========================
-- TABLA PRODUCTO
-- =========================

INSERT INTO producto
(id_usuario, nombre, precio)
VALUES

(1, 'Curso PostgreSQL', 120000),

(2, 'Pack UI UX', 90000);

-- =========================
-- TABLA EVENTO
-- =========================

INSERT INTO evento
(id_usuario, titulo, fecha_evento)
VALUES

(1, 'Hackathon Pascualina', CURRENT_DATE),

(2, 'Workshop UX', CURRENT_DATE);

-- =========================
-- TABLA USUARIO_HABILIDAD
-- =========================

INSERT INTO usuario_habilidad
(id_usuario, habilidad)
VALUES

(1, 'SQL'),
(1, 'Python'),
(2, 'Excel'),
(3, 'UI UX');