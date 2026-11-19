/*
	La sentencia u orden siguiente pone en uso la base de datos 
    o esquema world para realizar consultas a sus tablas
*/
use world;

-- Comentario de linea
/*
	La sintaxis de la sentencia de SQL mas pequeña que se puede ejecutar
    por ejemplo, para recuperar todos los reqistros de la tabla country
    
    select * from country -> Esta era la sintaxis mas pequeña antes ahora se usa la siguiente:
*/
table country;

/*
	Recuperar un campo de la tabla country
    
	Para establecer un alias antiguamente se usaba la palabra reservada as pero actualmente con poner el nombre que le quieres poner a la tabla
	Para poner espacio en los alias solo hace falta encapsularlo entre backticks (la tecla a la derecha de la tecla p)
 */
select Region `La Region` from country;

/*
	Para recuperar varias columnas de la misma tabla ponemos las columnas que queramos seguidos de coma
*/
select Name `Nombre`, Region `La region`,SurfaceArea `Superficie de la region` from country;

/*
 	Uso de la clausula distinct, por ejemplo para ver cuantas regiones diferentes exisiten en la tabla country
 	Para ordenar los resultados usamos la clausula order by y si usamos asc se ordenaria de manera alfabeticamente
*/
select distinct Region `Regiones que hay sin repeticiones` from country order by Region asc;

/*
	Para limitar la cantidad de registros devueltos se utiliza limit al final de la consulta
    Si queremos saltar X registros de la tabla le meteriamos un segundo parametro en la clausula limit
    Y la sentencia limit se modificaria donde el 1º parametro es el numero de registros que saltamos y el 2º seria la cantidad de registros que queremos usar
*/
select distinct Region `Mostrar 5 registros empezando a partir del registro 3` from country order by Region asc limit 3,5;

/*
	Ejercicio: Recuperar el pais (Name) que tiene la mayor poblacion (Population) del mundo
*/
select Name, Population from country order by Population desc limit 1;


