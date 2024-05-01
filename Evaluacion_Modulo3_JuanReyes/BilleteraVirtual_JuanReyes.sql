create database if not exists BILLETERA_VIRTUAL;
use BILLETERA_VIRTUAL;

-- creacion tabla usuarios --
create table if not exists USUARIOS(
	id_usuario int auto_increment primary key,
	nombre_usuario varchar(50),
	correo_electronico varchar(50),
	contrasena varchar(50),
	saldo decimal(10,2),
	fecha_creacion timestamp default current_timestamp
);
COMMIT;

-- creacion tabla movimientos --
create table if not exists MOVIMIENTOS(
	id_movimiento int auto_increment primary key,
	id_usuario_envia int,
	id_usuario_recibe int,
	valor decimal(10,2),
	fecha_transaccion timestamp default current_timestamp,
	constraint fk_movimiento_usuario_envia foreign key(id_usuario_envia) references USUARIOS(id_usuario) on delete cascade,
	constraint fk_movimiento_usuario_recibe foreign key(id_usuario_recibe) references USUARIOS(id_usuario) on delete cascade
);
COMMIT;

-- creacion tabla cuentas --
create table if not exists CUENTAS(
	id_cuenta int primary key,
    id_usuario int,
	saldo decimal(10,2),
    constraint fk_cuenta_usuario foreign key (id_usuario) references USUARIOS(id_usuario)
);
COMMIT;

-- creacion tabla moneda --
create table if not exists MONEDAS(
	id_divisa int auto_increment primary key,
	nombre_divisa varchar(20),
	simbolo_divisa	 varchar(5)
);
COMMIT;



-- inserciones de datos a las tablas--
insert into USUARIOS values (default, "Pedro Perez Gonzalez", "aaaaa@gmail.com", sha("123456"), 1000000, default);
insert into USUARIOS values (default, "Camila Morales Leon", "bbbbb@gmail.com", sha("123456"), 1500000, default);
insert into USUARIOS values (default, "Maxi Aurelio Pomp", "ccccc@gmail.com", sha("123456"), 5000000, default);
COMMIT;

-- inserciones tabla movimientos --
insert into MOVIMIENTOS values (default, 1, 2, 25000, default);
insert into MOVIMIENTOS values (default, 1, 3, 50000, default);
insert into MOVIMIENTOS values (default, 2, 3, 125000, default);
insert into MOVIMIENTOS values (default, 3, 1, 15000, default);
insert into MOVIMIENTOS values (default, 1, 1, 50000, default);
COMMIT;

-- inserciones tabla monedas --
insert into MONEDAS values (default, "Dolar", "$");
insert into MONEDAS values (default, "Euro", "Є");
insert into MONEDAS values (default, "Libra", "£");
COMMIT;

-- inserciones tabla cuentas --
insert into CUENTAS values (1, 1, 1000);
insert into CUENTAS values (2, 3, 2000);
COMMIT;