-- 1. Crear la base de datos
CREATE DATABASE MiBaseDeDatos;

-- 3. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    edad INTEGER NOT NULL
);

-- 4. Insertar dos registros en la tabla Usuarios
INSERT INTO Usuarios (nombre, edad) VALUES ('Eduardo', 33), ('Henrique', 26);

-- 5. Actualizar la edad de un usuario
UPDATE Usuarios SET edad = 28 WHERE nombre = 'Eduardo';

-- 6. Eliminar un usuario
DELETE FROM Usuarios WHERE nombre = 'Henrique';

-- 1. Crear la tabla Ciudades con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE Ciudades (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    pais TEXT NOT NULL
);

-- 2. Insertar al menos tres registros en la tabla Ciudades
INSERT INTO Ciudades (nombre, pais) VALUES 
('Granada', 'España'), 
('Curitiba', 'Brasil'), 
('Nueva York', 'Estados Unidos');

-- 3. Agregar la columna ciudad_id a la tabla Usuarios y crear la clave foránea
ALTER TABLE Usuarios ADD COLUMN ciudad_id INTEGER;
ALTER TABLE Usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id);

-- 4. Consulta con LEFT JOIN
SELECT Usuarios.nombre AS usuario, Ciudades.nombre AS ciudad, Ciudades.pais
FROM Usuarios
LEFT JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;

-- 5. Consulta con INNER JOIN
SELECT Usuarios.nombre AS usuario, Ciudades.nombre AS ciudad, Ciudades.pais
FROM Usuarios
INNER JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;
