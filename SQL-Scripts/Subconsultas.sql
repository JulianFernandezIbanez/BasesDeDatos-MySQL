/*
	Subconsultas, son consultas select detro de otras consultas
*/
use world;

/*
	Ejercicio: 
    Recuperar el pais (Name) que tiene la mayor poblacion (Population) del mundo
    Solucion con subconsultas
*/
select Name, Population 
from country
where Population = (select max(population) from country)
order by Population desc ;

/* 
	Ejercicio:
	Recuperar la ciudad mas poblada y el nombre del pais donde se encuetra dicha ciudad
    Esta es una solucion mas eficiente aplicando subconsultas
 */
select country.name `Nombre del Pais`, country.Region, city.name `Nombre de la ciudad`, city.Population `Poblacion mas alta`
from country left join city on country.Code = city.CountryCode
where city.Population = (select max(Population) from city)
order by city.Population desc;

-- Vamos a usar la BD Jardineria para los siguinete ejemplo
use jardineria;

-- Recuperar el nombre del producto que tiene el mayor precio
select nombre, precio_venta from producto where precio_venta = (select max(precio_venta) from producto);

-- Para los siguinetes ejercicios vamos a usar la tabla tienda
use tienda;

-- Subconsultas en la clausula having
-- Recuperar un listado cono todos los nombres de los fabricantes que tinen el mismo numero de productos que el fabricante ASUS
select fabricante.nombre, count(*) `Numero de productos`
from fabricante join producto on fabricante.id = producto.id_fabricante
group by fabricante.nombre 
having `Numero de productos` = (select count(producto.id_fabricante) from fabricante join producto on fabricante.id = producto.id_fabricante and fabricante.nombre like 'Asus');

-- Ejercicio:
-- Eliminar del resultado anterior el resultado Asus
select fabricante.nombre, count(*) `Numero de productos`
from fabricante join producto on fabricante.id = producto.id_fabricante and fabricante.nombre not like 'Asus'
group by fabricante.nombre 
having `Numero de productos` = (select count(producto.id_fabricante) from fabricante join producto on fabricante.id = producto.id_fabricante and fabricante.nombre like 'Asus');

-- Subconsultas en la clausula from
-- Recuperar el listado de todos los productos que tienen un precio mayor o igual al precio promedio de todos los productos de su mismo fabricante
select * from producto join (select id_fabricante, avg(precio) ` Precio promedio` from producto group by id_fabricante) `Promedio por fabricante` on producto.id_fabricante = `Promedio por fabricante`.id_fabricante
and producto.precio >= `Precio promedio`;
