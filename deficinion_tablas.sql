-- Requerimiento 1

CREATE DATABASE peliculas;

\c peliculas

-- Requerimiento 2

CREATE TABLE peliculas(
    id INT,
    titulo VARCHAR(60),
    año INT,
    director VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE reparto(
    id_pelicula INT,
    nombre VARCHAR(30),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

-- Requerimiento 3

\copy peliculas FROM 'Downloads/peliculas.csv' CSV HEADER;
\copy reparto FROM 'Downloads/reparto.csv' CSV;

-- Requerimiento 4

SELECT * FROM reparto WHERE id_pelicula = (SELECT id FROM peliculas WHERE titulo='Titanic');

-- Requerimiento 5

SELECT COUNT(id_pelicula) FROM reparto WHERE nombre = 'Harrison Ford';

-- Requerimiento 6

SELECT * FROM peliculas WHERE año BETWEEN 1990 AND 1999 ORDER BY titulo ASC;

-- Requerimiento 7

SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas GROUP BY titulo;

-- Requerimiento 8

SELECT MAX(LENGTH(titulo)) FROM peliculas;
