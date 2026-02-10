CREATE DATABASE biblioteca_escolar1;
USE biblioteca_escolar1;

CREATE TABLE alumno (
  id_alumno INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  carrera VARCHAR(100) NOT NULL,
  grado INT NOT NULL CHECK (grado BETWEEN 1 AND 12)
);
CREATE TABLE libro (
  id_libro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  autor VARCHAR(100) NOT NULL,
  editorial VARCHAR(100),
  existencias INT NOT NULL CHECK (existencias >= 0)
);
CREATE TABLE bibliotecario (
  id_bibliotecario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  turno VARCHAR(20) NOT NULL,
  telefono VARCHAR(15)
);
CREATE TABLE prestamo (
  id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
  id_alumno INT NOT NULL,
  id_libro INT NOT NULL,
  id_bibliotecario INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE,
  estado VARCHAR(20) NOT NULL,

  FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
  FOREIGN KEY (id_libro) REFERENCES libro(id_libro),
  FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

CREATE INDEX idx_prestamo_alumno ON prestamo(id_alumno);
CREATE INDEX idx_prestamo_libro ON prestamo(id_libro);

EXPLAIN SELECT * FROM prestamo WHERE id_alumno = 1;