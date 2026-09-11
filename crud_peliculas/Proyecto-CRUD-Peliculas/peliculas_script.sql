-- ============================================================
--  Script SQL - CRUD Películas
--  Base de datos: crud_peliculas
-- ============================================================

-- 1. Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS crud_peliculas
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- 2. Usar la base de datos
USE crud_peliculas;

-- 3. Crear la tabla de películas
CREATE TABLE IF NOT EXISTS peliculas (
    id            BIGINT       NOT NULL AUTO_INCREMENT,
    titulo        VARCHAR(150) NOT NULL,
    director      VARCHAR(100) NOT NULL,
    genero        VARCHAR(50)  NOT NULL,
    anio          INT          NOT NULL,
    calificacion  DOUBLE       NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Datos de ejemplo (opcionales)
INSERT INTO peliculas (titulo, director, genero, anio, calificacion) VALUES
('El Padrino',             'Francis Ford Coppola', 'Drama',         1972, 9.2),
('Interestelar',           'Christopher Nolan',    'Ciencia Ficción', 2014, 8.6),
('El Rey León',            'Roger Allers',         'Animación',     1994, 8.5),
('Parásitos',              'Bong Joon-ho',         'Thriller',      2019, 8.5),
('Toy Story',              'John Lasseter',        'Animación',     1995, 8.3);
