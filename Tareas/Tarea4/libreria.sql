create database LIBRERIA;
use LIBRERIA;

create table LIBRO(
libroID int primary key,
titulo varchar (70) not null,
autor varchar (50) not null,
ano_publicacion date
);

insert into LIBRO (libroID, titulo, autor, ano_publicacion) values
		(354, "el quijote" , "miguel de cervante","1605-12-01"),
        (358, "el codigo da vinci", "dan brown", "1990-06-05");


create table LIBRO_COPIA(
copiaID int primary key auto_increment,
estado_libro varchar (70) not null,
ubicacion varchar (70) not null,
libroID int,
CONSTRAINT FK_LIBRO_LIBRO_COPIA FOREIGN KEY(libroID) REFERENCES LIBRO(libroID)
); 