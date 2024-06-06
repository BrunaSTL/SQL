-- 1. Crear la tabla Pedidos
CREATE TABLE Pedidos (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

-- 2. Insertar al menos tres registros en la tabla Pedidos
INSERT INTO Pedidos (id_usuario, id_producto) VALUES 
(1, 1), 
(1, 3), 
(2, 2);

-- 3. Consulta que muestra los nombres de los usuarios y los nombres de los productos que han comprado, incluye a aquellos que no han realizado ningún pedido
SELECT 
    Usuarios.nombre AS usuario, 
    COALESCE(Productos.nombre, 'No ha realizado ningún pedido') AS producto
FROM 
    Usuarios
LEFT JOIN 
    Pedidos ON Usuarios.id = Pedidos.id_usuario
LEFT JOIN 
    Productos ON Pedidos.id_producto = Productos.id;

-- 4. Consulta que muestra los nombres de los usuarios que han realizado un pedido y los que no han realizado ningún pedido
SELECT 
    Usuarios.nombre AS usuario, 
    CASE 
        WHEN Pedidos.id IS NOT NULL THEN 'Ha realizado un pedido'
        ELSE 'No ha realizado ningún pedido'
    END AS estado_pedido
FROM 
    Usuarios
LEFT JOIN 
    Pedidos ON Usuarios.id = Pedidos.id_usuario;

-- 5. Agregar una nueva columna llamada "cantidad" a la tabla Pedidos y actualizar los registros existentes con un valor
-- Agregar la nueva columna
ALTER TABLE Pedidos ADD COLUMN cantidad INTEGER;

-- Actualizar los registros existentes con un valor
UPDATE Pedidos SET cantidad = 1 WHERE cantidad IS NULL;
