CREATE DATABASE cafeteria_escolar;
USE cafeteria_escolar;

CREATE TABLE alumno (
  id_alumno INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  grado INT NOT NULL,
  grupo VARCHAR(10) NOT NULL
);
CREATE TABLE empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  turno VARCHAR(20) NOT NULL,
  puesto VARCHAR(50) NOT NULL
);
CREATE TABLE producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  stock INT NOT NULL
);

CREATE TABLE pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_alumno INT NOT NULL,
  id_empleado INT NOT NULL,
  fecha DATE NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);
CREATE TABLE detalle_pedido (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
USE cafeteria_escolar;

CREATE INDEX idx_pedido_alumno ON pedido(id_alumno);
CREATE INDEX idx_detalle_producto ON detalle_pedido(id_producto);

EXPLAIN SELECT * FROM pedido WHERE id_alumno = 1;




