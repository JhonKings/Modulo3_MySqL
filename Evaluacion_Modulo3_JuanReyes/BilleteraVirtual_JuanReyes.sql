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

-- creacion tabla cuentas --
create table if not exists CUENTAS(
	id_cuenta int primary key,
    id_usuario int,
	saldo decimal(10,2),
    constraint fk_cuenta_usuario foreign key (id_usuario) references USUARIOS(id_usuario)
);

-- creacion tabla moneda --
create table if not exists MONEDAS(
	id_divisa int auto_increment primary key,
	nombre_divisa varchar(20),
	simbolo_divisa	 varchar(5)
);

