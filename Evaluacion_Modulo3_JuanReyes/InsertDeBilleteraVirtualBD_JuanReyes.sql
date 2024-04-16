use BILLETERA_VIRTUAL;


-- inserciones a las tablas--
insert into USUARIOS values (default, "Pedro Perez Gonzalez", "aaaaa@gmail.com", sha("123456"), 1000000, default);
insert into USUARIOS values (default, "Camila Morales Leon", "bbbbb@gmail.com", sha("123456"), 1500000, default);
insert into USUARIOS values (default, "Maxi Aurelio Pomp", "ccccc@gmail.com", sha("123456"), 5000000, default);


-- inserciones tabla movimientos --
insert into MOVIMIENTOS values (default, 1, 2, 25000, default);
insert into MOVIMIENTOS values (default, 1, 3, 50000, default);
insert into MOVIMIENTOS values (default, 2, 3, 125000, default);
insert into MOVIMIENTOS values (default, 3, 1, 15000, default);
insert into MOVIMIENTOS values (default, 1, 1, 50000, default);


-- inserciones tabla monedas --
insert into MONEDAS values (default, "Dolar", "$");
insert into MONEDAS values (default, "Euro", "Є");
insert into MONEDAS values (default, "Libra", "£");


-- inserciones tabla cuentas --
insert into CUENTAS values (1, 1, 1000);
insert into CUENTAS values (2, 3, 2000);