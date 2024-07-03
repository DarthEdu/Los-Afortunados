create database los_afortunados;
use los_afortunados;
-- creacion de la tabla clientes
create table clientes (
	id_cliente int primary key,
    nombre varchar(100),
    email varchar(100)
);

-- creacion de la tabla cuentas
create table cuentas (
	id_cuenta int primary key,
    id_cliente int,
    saldo decimal(10,2),
    foreign key (id_cliente) references clientes(id_cliente)
);

-- creacion de la tabla transacciones
create table transacciones (
	id_transaccion int primary key,
    id_cuenta int,
    monto decimal(10,2),
    fecha date,
    foreign key (id_cuenta) references cuentas(id_cuenta)
);

-- Ejercicio 1: Selección y Filtración Básica
-- Insertar datos en clientes
insert into clientes (id_cliente, nombre, email) values
(1, 'Juan Perez', 'juan.perez@email.com'),
(2, 'Maria Lopez', 'maria.lopez@email.com'),
(3, 'Angel Ruiz', 'angel.ruiz@email.com'),
(4, 'Mateo Porras', 'mateo.porras@email.com'),
(5, 'Eduardo Lema', 'eduardo.lema@email.com');

-- Insertar datos en Cuentas
INSERT INTO Cuentas (id_cuenta, id_cliente, saldo) VALUES
(1, 1, 5000.00),
(2, 1, 1500.00),
(3, 2, 3000.00),
(4, 3, 2500.00),
(5, 3, 3500.00),
(6, 4, 2500.00),
(7, 5, 1500.00),
(8, 2, 5000.00);

-- Insertar datos en Transacciones
INSERT INTO Transacciones (id_transaccion, id_cuenta, monto, fecha) VALUES
(1, 1, 200.00, '2024-01-15'),
(2, 2, -150.00, '2024-02-20'),
(3, 3, 1000.00, '2023-06-10'),
(4, 1, -50.00, '2024-03-05'),
(5, 2, 300.00, '2023-08-15'),
(6, 3, -200.00, '2024-04-20'),
(7, 1, 500.00, '2023-07-30'),
(8, 2, 1000.00, '2024-01-25');

-- Selección del id_cuenta y saldo de todas las cuentas
SELECT id_cuenta, saldo FROM Cuentas;

-- Filtrar cuentas con saldo mayor a 4000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo > 4000;

-- Seleccionar cuentas con saldo menor a 2000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo < 2000;

-- Mostrar nombres de los clientes y la longitud de sus nombres
SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Clientes;

-- Seleccionar cuentas con saldo entre 1000 y 3000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo BETWEEN 1000 AND 3000;

-- Obtener una lista de todos los clientes y sus cuentas, mostrando los valores NULL
SELECT Clientes.id_cliente, Clientes.nombre, Cuentas.id_cuenta, Cuentas.saldo
FROM Clientes
LEFT JOIN Cuentas ON Clientes.id_cliente = Cuentas.id_cliente;

-- Concatenar el nombre del cliente y su email con un separador
SELECT CONCAT(nombre, ' - ', email) AS nombre_email FROM Clientes;

-- Extraer los últimos 3 caracteres del email de cada cliente
SELECT SUBSTRING(email, -3) AS ultimos_tres_caracteres FROM Clientes;

-- Convertir el nombre del cliente a minúsculas
SELECT LOWER(nombre) AS nombre_minusculas FROM Clientes;

-- Convertir el nombre del cliente a mayúsculas
SELECT UPPER(nombre) AS nombre_mayusculas FROM Clientes;

-- Seleccionar las transacciones ordenadas por monto de mayor a menor, mostrando solo las primeras 10
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 10;

-- Calcular el saldo de cada cuenta después de aplicar un interés del 5%
SELECT id_cuenta, saldo, saldo * 1.05 AS saldo_con_interes FROM Cuentas;

-- Reemplazar el dominio del email de los clientes: email, '@example.com', '@newdomain.com'
SELECT REPLACE(email, '@example.com', '@newdomain.com') AS nuevo_email FROM Clientes;
-- Ejercicio 2
-- Selecciona el nombre de cada cliente.
SELECT nombre FROM Clientes;

-- Añade una columna que muestre el email del cliente en el formato Correo: [email].
SELECT nombre, CONCAT('Correo: ', email) AS email_formateado FROM Clientes;

-- Mostrar los emails de los clientes en minúsculas
SELECT LOWER(email) AS email_minusculas FROM Clientes;

-- Mostrar el nombre del cliente en mayúsculas
SELECT UPPER(nombre) AS nombre_mayusculas FROM Clientes;


-- Ejercicio 3
-- Selecciona el id_cuenta.
SELECT id_cuenta FROM Cuentas;

-- Calcula el total de las transacciones realizadas en cada cuenta.
SELECT id_cuenta, SUM(monto) AS total_transacciones FROM Transacciones GROUP BY id_cuenta;

-- Calcular el saldo total de todas las cuentas
SELECT SUM(saldo) AS saldo_total FROM Cuentas;

-- Calcular el monto total de todas las transacciones
SELECT SUM(monto) AS monto_total_transacciones FROM Transacciones;

-- Calcular el monto promedio de las transacciones
SELECT AVG(monto) AS monto_promedio_transacciones FROM Transacciones;

-- Ejercicio 4
-- Selecciona el id_transaccion y la fecha de todas las transacciones.
SELECT id_transaccion, fecha FROM Transacciones;

-- Extraer el año de la fecha de cada transacción
SELECT id_transaccion, YEAR(fecha) AS anio FROM Transacciones;

-- Extraer el mes de la fecha de cada transacción
SELECT id_transaccion, MONTH(fecha) AS mes FROM Transacciones;

-- Extraer el día de la semana de la fecha de cada transacción
SELECT id_transaccion, DAYOFWEEK(fecha) AS dia_semana FROM Transacciones;

-- Filtra las transacciones que se realizaron en el año 2024.
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2024;

-- Seleccionar las transacciones realizadas en 2023.
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

-- Seleccionar las transacciones realizadas en el mes de junio de cualquier año
SELECT * FROM Transacciones WHERE MONTH(fecha) = 6;

-- Seleccionar las transacciones realizadas el 15 de cada mes
SELECT * FROM Transacciones WHERE DAY(fecha) = 15;

-- Ejercicio 5
-- Selecciona el id_cuenta.
SELECT id_cuenta FROM Cuentas;

-- Cuenta el número de transacciones realizadas en cada cuenta.
SELECT id_cuenta, COUNT(*) AS numero_transacciones FROM Transacciones GROUP BY id_cuenta;

-- Calcular el saldo promedio de todas las cuentas.
SELECT AVG(saldo) AS saldo_promedio FROM Cuentas;

-- Ejercicio 6
-- Seleccionar las transacciones con un monto negativo
SELECT * FROM Transacciones WHERE monto < 0;

-- Seleccionar las transacciones con un monto positivo
SELECT * FROM Transacciones WHERE monto > 0;

-- Ejercicios 7
-- Seleccionar todas las cuentas ordenadas por saldo de mayor a menor
SELECT * FROM Cuentas ORDER BY saldo DESC;

-- Seleccionar todos los clientes ordenados alfabéticamente por nombre
SELECT * FROM Clientes ORDER BY nombre;

-- Seleccionar las transacciones realizadas en 2023
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

-- Seleccionar las cuentas ordenadas por saldo de menor a mayor, mostrando solo las primeras 5
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 5;

-- Ejercicio 8
-- Contar el número total de clientes
SELECT COUNT(*) AS total_clientes FROM Clientes;

-- Contar el número total de cuentas
SELECT COUNT(*) AS total_cuentas FROM Cuentas;

-- Contar el número total de transacciones
SELECT COUNT(*) AS total_transacciones FROM Transacciones;

-- Redondear el saldo de cada cuenta a dos decimales
SELECT id_cuenta, ROUND(saldo, 2) AS saldo_redondeado FROM Cuentas;

-- Ejercicios 9
-- Encontrar la cuenta con el saldo más alto
SELECT * FROM Cuentas ORDER BY saldo DESC LIMIT 1;

-- Encontrar la cuenta con el saldo más bajo
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 1;

-- Encontrar la transacción con el monto más alto
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 1;

-- Encontrar la transacción con el monto más bajo
SELECT * FROM Transacciones ORDER BY monto ASC LIMIT 1;
