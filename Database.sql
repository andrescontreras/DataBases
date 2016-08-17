/*
Proyecto de Bases de datos 2016-30
Pablo no vino HOY
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
  nombre varchar (20) NOT NULL,
  PRIMARY KEY (cod_continente,cod_pais),
  FOREIGN KEY (cod_continente) REFERENCES continente(cod_continente)
);
CREATE TABLE moneda(
  id_moneda numeric (3,0) PRIMARY KEY,
  nombre varchar (10) NOT NULL
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
  FOREIGN KEY (id_moneda_destino) REFERENCES moneda(id_moneda)
);

/* Insercion de datos en las tablas */


/* Punto 1: Monedas por continente */



/* Punto 2: Moneda con tasas de cambio en todas las monedas */



/* Punto 3: Monedas que faltan tasas de cambio respecto a las demas monedas */



/* Punto 4: Porcentaje de aumento o disminucion de la tasa de cambio de cada combinacion */
