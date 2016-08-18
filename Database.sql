/*
Proyecto de Bases de datos 2016-30

Realizado por:
  Pablo Ariza
  Alejandro Castro
  Andres Contreras
  Santiago Salamanca
*/

/* Creacion de tablas (No olvidar DROP TABLE)*/
DROP TABLE tasas;
DROP TABLE monedaXpais;
DROP TABLE moneda;
DROP TABLE pais;
DROP TABLE continente;

CREATE TABLE continente(
  cod_continente numeric (3,0) PRIMARY KEY,
  descripcion varchar (50) NOT NULL UNIQUE
);
CREATE TABLE pais (
  cod_continente numeric (3,0),
  cod_pais numeric (3,0),
  nombre varchar (30) NOT NULL UNIQUE,
  PRIMARY KEY (cod_continente,cod_pais),
  FOREIGN KEY (cod_continente) REFERENCES continente(cod_continente)
);
CREATE TABLE moneda(
  id_moneda numeric (3,0) PRIMARY KEY,
  nombre varchar (40) NOT NULL UNIQUE
);
CREATE TABLE monedaXpais(
  id_moneda numeric (3,0),
  cod_continente numeric (3,0),
  id_pais numeric (3,0),
  PRIMARY KEY (id_moneda,cod_continente,id_pais),
  FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
  FOREIGN KEY (cod_continente,id_pais) REFERENCES pais(cod_continente,cod_pais)
);
CREATE TABLE tasas(
  id_moneda_origen numeric (3,0),
  id_moneda_destino numeric (3,0),
  fecha date,
  tasa_cambio numeric (5,2),
  PRIMARY KEY (id_moneda_origen,id_moneda_destino,fecha),
  FOREIGN KEY (id_moneda_origen) REFERENCES moneda(id_moneda),
  FOREIGN KEY (id_moneda_destino) REFERENCES moneda(id_moneda),
  check (tasa_cambio < 0)
);

/* Insercion de datos en las tablas */

/*CONTINENTES*/
INSERT INTO continente values (1,'Europa');
INSERT INTO continente values (2,'America');
INSERT INTO continente values (3,'Oceania');
INSERT INTO continente values (4, 'Asia');
INSERT INTO continente values (5,'Africa'); 

/*PAISES EUROPA*/
INSERT INTO pais values (1,1,'Inglaterra');
INSERT INTO pais values (1,2,'Alemania');
INSERT INTO pais values (1,3,'Portugal');
INSERT INTO pais values (1,4,'Italia');
INSERT INTO pais values (1,5,'España');
INSERT INTO pais values (1,6,'Suecia');
INSERT INTO pais values (1,7,'Suiza');
INSERT INTO pais values (1,8,'Monaco');
INSERT INTO pais values (1,9,'Francia');
INSERT INTO pais values (1,10,'Belgica');

/*PAISES AMERICA*/
INSERT INTO pais values (2,1,'Estados Unidos');
INSERT INTO pais values (2,2,'Canada');
INSERT INTO pais values (2,3,'Mexico');
INSERT INTO pais values (2,4,'Honduras');
INSERT INTO pais values (2,5,'Jamaica');
INSERT INTO pais values (2,6,'Panama');
INSERT INTO pais values (2,7,'Colombia');
INSERT INTO pais values (2,8,'Venezuela');
INSERT INTO pais values (2,9,'Chile');
INSERT INTO pais values (2,10,'Brasil');

/*PAISES OCEANIA*/
INSERT INTO pais values (3,1,'Australia');
INSERT INTO pais values (3,2,'Nueva Zelanda');
INSERT INTO pais values (3,3,'Islas Marshall');
INSERT INTO pais values (3,4,'Vanuatu');
INSERT INTO pais values (3,5,'Papua Nueva Guinea');
INSERT INTO pais values (3,6,'Kiribati');
INSERT INTO pais values (3,7,'Samoa');
INSERT INTO pais values (3,8,'Nauru');
INSERT INTO pais values (3,9,'Tonga');
INSERT INTO pais values (3,10,'Islas Salomon');

/*PAISES ASIA*/
INSERT INTO pais values (4,1,'China');
INSERT INTO pais values (4,2,'Filipinas');
INSERT INTO pais values (4,3,'Corea del Sur');
INSERT INTO pais values (4,4,'Singapur');
INSERT INTO pais values (4,5,'Laos');
INSERT INTO pais values (4,6,'Malasia');
INSERT INTO pais values (4,7,'Tailandia');
INSERT INTO pais values (4,8,'Japon');
INSERT INTO pais values (4,9,'Camboya');
INSERT INTO pais values (4,10,'India');

/*PAISES AFRICA*/
INSERT INTO pais values (5,1,'Madagascar');
INSERT INTO pais values (5,2,'Ghana');
INSERT INTO pais values (5,3,'Egipto');
INSERT INTO pais values (5,4,'Nigeria');
INSERT INTO pais values (5,5,'Etiopia');
INSERT INTO pais values (5,6,'Kenia');
INSERT INTO pais values (5,7,'Mali');
INSERT INTO pais values (5,8,'Marruecos');
INSERT INTO pais values (5,9,'Mozambique');
INSERT INTO pais values (5,10,'Tunez');

/*Insercion de monedas de los paises*/
INSERT INTO moneda values (1,'Euro');
INSERT INTO moneda values (2,'Libra Esterlina');
INSERT INTO moneda values (3,'Corona Sueca');
INSERT INTO moneda values (4,'Franco Suizo');
INSERT INTO moneda values (5,'Dolar USA');
INSERT INTO moneda values (6,'Dolar Canadiense');
INSERT INTO moneda values (7,'Peso Mexicano');
INSERT INTO moneda values (8,'Lempira');
INSERT INTO moneda values (9,'Dolar Jamaiquino');
INSERT INTO moneda values (10,'Balboa');
INSERT INTO moneda values (11,'Peso Colombiano');
INSERT INTO moneda values (12,'Bolivar');
INSERT INTO moneda values (13,'Peso Chileno');
INSERT INTO moneda values (14,'Real Brasileño');
INSERT INTO moneda values (15,'Dolar Australiano');
INSERT INTO moneda values (16,'Dolar Neozelandes');
INSERT INTO moneda values (17,'Vatu');
INSERT INTO moneda values (18,'Kina');
INSERT INTO moneda values (19,'Dolar de Kiribati');
INSERT INTO moneda values (20,'Tala');
INSERT INTO moneda values (21,'Pa?anga');
INSERT INTO moneda values (22,'Dolar de las Islas Salomon');
INSERT INTO moneda values (23,'Yuan Renminbi');
INSERT INTO moneda values (24,'Peso Filipino');
INSERT INTO moneda values (25,'Won');
INSERT INTO moneda values (26,'Dolar de Singapur');
INSERT INTO moneda values (27,'Kip');
INSERT INTO moneda values (28,'Ringgit Malaysio');
INSERT INTO moneda values (29,'Baht');
INSERT INTO moneda values (30,'Yen');
INSERT INTO moneda values (31,'Riel');
INSERT INTO moneda values (32,'Rupia Hindu');
INSERT INTO moneda values (33,'Franco Malgache');
INSERT INTO moneda values (34,'Cedi');
INSERT INTO moneda values (35,'Libra Egipcia');
INSERT INTO moneda values (36,'Naira');
INSERT INTO moneda values (37,'Biir Etiope');
INSERT INTO moneda values (38,'Chelin Keniata');
INSERT INTO moneda values (39,'Franco de Mali');
INSERT INTO moneda values (40,'Dirham Marroqui');
INSERT INTO moneda values (41,'Metical');
INSERT INTO moneda values (42,'Dinar Tunecino');

/*Monedas por pais EUROPA*/
INSERT INTO monedaXpais values (2,1,1);
INSERT INTO monedaXpais values (1,1,2);
INSERT INTO monedaXpais values (1,1,3);
INSERT INTO monedaXpais values (1,1,4);
INSERT INTO monedaXpais values (1,1,5);
INSERT INTO monedaXpais values (3,1,6);
INSERT INTO monedaXpais values (4,1,7);
INSERT INTO monedaXpais values (1,1,8);
INSERT INTO monedaXpais values (1,1,9);
INSERT INTO monedaXpais values (1,1,10);

/*Monedas por pais AMERICA*/
INSERT INTO monedaXpais values (5,2,1);
INSERT INTO monedaXpais values (6,2,2);
INSERT INTO monedaXpais values (7,2,3);
INSERT INTO monedaXpais values (8,2,4);
INSERT INTO monedaXpais values (9,2,5);
INSERT INTO monedaXpais values (10,2,6);
INSERT INTO monedaXpais values (11,2,7);
INSERT INTO monedaXpais values (12,2,8);
INSERT INTO monedaXpais values (13,2,9);
INSERT INTO monedaXpais values (14,2,10);

/*Monedas por pais OCEANIA*/
INSERT INTO monedaXpais values (15,3,1);
INSERT INTO monedaXpais values (16,3,2);
INSERT INTO monedaXpais values (5,3,3);
INSERT INTO monedaXpais values (17,3,4);
INSERT INTO monedaXpais values (18,3,5);
INSERT INTO monedaXpais values (19,3,6);
INSERT INTO monedaXpais values (20,3,7);
INSERT INTO monedaXpais values (15,3,8);
INSERT INTO monedaXpais values (21,3,9);
INSERT INTO monedaXpais values (22,3,10);

/*Monedas por pais ASIA*/
INSERT INTO monedaXpais values (23,4,1);
INSERT INTO monedaXpais values (24,4,2);
INSERT INTO monedaXpais values (25,4,3);
INSERT INTO monedaXpais values (26,4,4);
INSERT INTO monedaXpais values (27,4,5);
INSERT INTO monedaXpais values (28,4,6);
INSERT INTO monedaXpais values (29,4,7);
INSERT INTO monedaXpais values (30,4,8);
INSERT INTO monedaXpais values (31,4,9);
INSERT INTO monedaXpais values (32,4,10);

/*Monedas por pais AFRICA*/
INSERT INTO monedaXpais values (33,5,1);
INSERT INTO monedaXpais values (34,5,2);
INSERT INTO monedaXpais values (35,5,3);
INSERT INTO monedaXpais values (36,5,4);
INSERT INTO monedaXpais values (37,5,5);
INSERT INTO monedaXpais values (38,5,6);
INSERT INTO monedaXpais values (39,5,7);
INSERT INTO monedaXpais values (40,5,8);
INSERT INTO monedaXpais values (41,5,9);
INSERT INTO monedaXpais values (42,5,10);


commit;
/*VISTAS UTILES*/
DROP VIEW continentePais;
DROP VIEW monedaPais;
DROP VIEW paisMonedaNombres;
CREATE VIEW continentePais as(
select descripcion, nombre, cod_pais 
from continente natural join pais
);
CREATE VIEW monedaPais as(
select id_moneda, id_pais, nombre
from MONEDAXPAIS natural right outer join pais
where id_pais = cod_pais
);
CREATE VIEW paisMonedaNombres as(
select * 
from monedaPais left outer join moneda
using(id_moneda)
);

/* Punto 1: Monedas por continente */


/* Punto 2: Moneda con tasas de cambio en todas las monedas */



/* Punto 3: Monedas que faltan tasas de cambio respecto a las demas monedas */



/* Punto 4: Porcentaje de aumento o disminucion de la tasa de cambio de cada combinacion */
