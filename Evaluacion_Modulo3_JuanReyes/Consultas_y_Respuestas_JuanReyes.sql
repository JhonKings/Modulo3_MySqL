use BILLETERA_VIRTUAL;

-- ARCHIVO DE CONSULTAS Y RESPUESTAS --

-- CONSULTAS SQL --
-- 1 Consulta para obtener el nombre de la moneda elegida por un usuario específico: --
SELECT m.nombre_divisa
FROM MONEDAS m
JOIN CUENTAS c ON m.id_divisa = c.id_cuenta
WHERE c.id_usuario = 1;

-- 2Consulta para obtener las transacciones realizadas por un usuario específico:--
SELECT *
FROM MOVIMIENTOS
WHERE id_usuario_envia = 1;

-- 3 Consulta para obtener todos los usuarios registrados:--
SELECT *
FROM USUARIOS;

-- 4 Consulta para obtener todas las monedas registradas:--
SELECT *
FROM MONEDAS;

-- 5 Consulta para obtener todas las transacciones registradas:--
SELECT *
FROM MOVIMIENTOS;

-- 6 Consulta para obtener todas las transacciones realizadas por un usuario específico:--
SELECT *
FROM MOVIMIENTOS
WHERE id_usuario_envia = 1 OR id_usuario_recibe = 2;

-- 7 Consulta para obtener todas las transacciones recibidas por un usuario específico:--
SELECT *
FROM MOVIMIENTOS
WHERE id_usuario_recibe = 3;

-- 8 Sentencia DML para modificar el campo correo electrónico de un usuario específico:--
UPDATE USUARIOS
SET correo_electronico = 'nuevo_correo@example.com'
WHERE id_usuario = 2;

-- 9 Sentencia para eliminar los datos de una transacción (eliminado de la fila completa):--
DELETE FROM MOVIMIENTOS
WHERE id_movimiento = 8;

-- 10 Sentencia para DDL modificar el nombre de la columna correo_electronico por email: --
ALTER TABLE USUARIOS
CHANGE correo_electronico email VARCHAR(50);


/* CONSULTAS Y RESPUESTAS
1.- ¿Qué tipo de relación existe entre las entidades Usuario y Transacción?

Tipo de relación entre Usuario y Transacción:
La relación entre Usuario y Transacción es de uno a muchos (1:N). Un usuario puede realizar varias transacciones, pero cada transacción está asociada a un único usuario.

2.- ¿Cómo podemos asegurarnos de que cada transacción está asociada al usuario emisor y receptor correctos?

Asegurar que cada transacción está asociada al usuario correcto:
Para asegurarnos de que cada transacción está asociada al usuario emisor y receptor correctos, podemos utilizar restricciones de integridad referencial en la base de datos. 
Esto implica tener las claves foráneas (id_usuario_envia y id_usuario_recibe en la tabla MOVIMIENTOS) que hagan referencia a la clave primaria (id_usuario) de la tabla USUARIOS.

3.- ¿Cómo manejaremos la relación entre la entidad Transacción y la entidad Moneda?

Relación entre Transacción y Moneda:
La relación entre Transacción y Moneda puede ser de uno a uno (1:1) o de uno a muchos (1:N), dependiendo de cómo se modele la base de datos. Si cada transacción se realiza en una 
única moneda, entonces la relación es 1:1. Si una transacción puede involucrar varias monedas, entonces es 1:N.

4.- ¿Cuál debería ser la clave primaria de cada entidad para garantizar la unicidad?

Clave primaria de cada entidad:
Para la entidad USUARIOS, la clave primaria debería ser id_usuario.
Para la entidad TRANSACCIONES, la clave primaria debería ser id_movimiento.
Para la entidad MONEDAS, la clave primaria debería ser id_divisa.

5.- ¿Qué restricciones debemos aplicar para mantener la integridad de
los datos?

Restricciones para mantener la integridad de los datos:
Restricciones de clave primaria: Para garantizar la unicidad de los registros en cada tabla.
Restricciones de clave foránea: Para garantizar que las relaciones entre tablas sean válidas y que no se puedan insertar valores que no existan en la tabla referenciada.
Restricciones NOT NULL: Para asegurar que los campos obligatorios no estén vacíos.
Restricciones de CHECK: Para validar que los valores de ciertos campos cumplan ciertas condiciones (por ejemplo, saldo positivo en una transacción).
*/