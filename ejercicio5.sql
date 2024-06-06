-- 1. Crear la tabla Clientes
CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);

-- 2. Insertar un cliente
INSERT INTO Clientes (id, nombre) VALUES (1, 'John');

-- 3. Actualizar el nombre del cliente
UPDATE Clientes SET nombre = 'John Doe' WHERE id = 1;

-- 4. Eliminar el cliente
DELETE FROM Clientes WHERE id = 1;

-- 5. Leer todos los clientes
SELECT * FROM Clientes;

-- 6. Crear la tabla Pedidos
CREATE TABLE Pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- 7. Insertar un pedido
INSERT INTO Pedidos (id, cliente_id) VALUES (1, 1);

-- 8. Actualizar el cliente_id del pedido
UPDATE Pedidos SET cliente_id = 2 WHERE id = 1;

-- 9. Eliminar el pedido
DELETE FROM Pedidos WHERE id = 1;

-- 10. Leer todos los pedidos
SELECT * FROM Pedidos;

-- 11. Crear la tabla Productos
CREATE TABLE Productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    precio NUMERIC
);

-- 12. Insertar productos
INSERT INTO Productos (id, nombre, precio) VALUES
(1, 'Laptop', 1000.00),
(2, 'Mouse', 25.50),
(3, 'Teclado', 45.00),
(4, 'Monitor',300.00),
(5, 'Impresora', 150.00);

-- 13. Actualizar el precio de un producto
UPDATE Productos SET precio = 950.00 WHERE id = 1;

-- 14. Eliminar un producto
DELETE FROM Productos WHERE id = 5;

-- 15. Leer todos los productos
SELECT * FROM Productos;

-- 16. Crear la tabla DetallesPedido
CREATE TABLE DetallesPedido (
    pedido_id INTEGER,
    producto_id INTEGER,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- 17. Insertar un detalle de pedido
INSERT INTO DetallesPedido (pedido_id, producto_id) VALUES (1, 1);

-- 18. Actualizar el producto_id del detalle de pedido
UPDATE DetallesPedido SET producto_id = 2 WHERE pedido_id = 1;

-- 19. Eliminar el detalle de pedido
DELETE FROM DetallesPedido WHERE pedido_id = 1;

-- 20. Leer todos los detalles de pedido
SELECT * FROM DetallesPedido;

-- 21. Consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un INNER JOIN
SELECT Clientes.nombre, Pedidos.id
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id;

-- 22. Consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un LEFT JOIN
SELECT Clientes.nombre, Pedidos.id
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id;

-- 23. Consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un INNER JOIN
SELECT Productos.nombre, DetallesPedido.pedido_id
FROM Productos
INNER JOIN DetallesPedido ON Productos.id = DetallesPedido.producto_id;

-- 24. Consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un LEFT JOIN
SELECT Productos.nombre, DetallesPedido.pedido_id
FROM Productos
LEFT JOIN DetallesPedido ON Productos.id = DetallesPedido.producto_id;

-- 25. Crear una nueva columna llamada "telefono" en la tabla Clientes
ALTER TABLE Clientes ADD COLUMN telefono TEXT;

-- 26. Modificar la columna "telefono" en la tabla Clientes para cambiar su tipo de datos a entero
ALTER TABLE Clientes ALTER COLUMN telefono TYPE INTEGER USING telefono::integer;

-- 27. Eliminar la columna "telefono" de la tabla Clientes
ALTER TABLE Clientes DROP COLUMN telefono;

-- 28. Cambiar el nombre de la tabla Clientes a Usuarios
ALTER TABLE Clientes RENAME TO Usuarios;

-- 29. Cambiar el nombre de la columna nombre en la tabla Usuarios a nombre_completo
ALTER TABLE Usuarios RENAME COLUMN nombre TO nombre_completo;

-- 30. Agregar una restricción de clave primaria a la columna id en la tabla Usuarios
ALTER TABLE Usuarios ADD PRIMARY KEY (id);



