-- 1. Crear la tabla Productos
CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio NUMERIC NOT NULL
);

-- 2. Insertar al menos cinco registros en la tabla Productos
INSERT INTO Productos (nombre, precio) VALUES 
('Movil', 519.99), 
('Ordenador', 1229.99), 
('Auriculares', 49.99), 
('Raton', 15.99), 
('Tablet', 379.99);

-- 3. Actualizar el precio de un producto en la tabla Productos
UPDATE Productos SET precio = 17.99 WHERE nombre = 'Raton';

-- 4. Eliminar un producto de la tabla Productos
DELETE FROM Productos WHERE nombre = 'Ordenador';

-- Definición de la tabla Pedidos (como si aún no estuviera creada)
CREATE TABLE Pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- 5. Consulta que muestra los nombres de los usuarios junto con los nombres de los productos que han comprado
SELECT Usuarios.nombre AS usuario, Productos.nombre AS producto
FROM Usuarios
INNER JOIN Pedidos ON Usuarios.id = Pedidos.usuario_id
INNER JOIN Productos ON Pedidos.producto_id = Productos.id;
