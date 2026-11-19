/*
	Consultas de varias tablas
*/
use empresa;

-- Recuperar todos los empleados con sus telefonos
select nombre, primerApellido, segundoApellido, fechaAlta, salario, numero from empleados inner join telefonos on empleados.id = telefonos.empleado_id;

-- Recuperar los empleados que tengan o no telefono
select nombre, primerApellido, segundoApellido, fechaAlta, salario, numero from empleados left join telefonos on empleados.id = telefonos.empleado_id;

-- Ejercicio:
-- Mostrar los paises y el idioma en cada pais pero solo los que tienen un idioma oficial
use world;

select name, region, language 
from country left join countrylanguage on country.Code = countrylanguage.CountryCode 
where countrylanguage.IsOfficial is true;

-- Ejercicio
-- Modificar la consulta anterior para que muestre los resultados para España y todos los idiomas, no solo los oficiales
select name, region, language 
from country left join countrylanguage on country.Code = countrylanguage.CountryCode 
where country.Name like 'Spain';

-- Ejercicio
-- Recuperar la ciudad mas poblada y el nombre del pais donde se encuetra dicha ciudad
select country.name `Nombre del Pais`, country.Region, city.name `Nombre de la ciudad`, city.Population `Poblacion mas alta`
from country left join city on country.Code = city.CountryCode
order by city.Population desc limit 1;