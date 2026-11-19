/*
	Las funciones de agregado, tambien llamadas operaciones de agregado, agrupan registros para obtener un resultado
*/
use world;

-- Contar el total de paises que hay en la tabla country
select count(name) `Total de paises` from country;

-- Version mas "experimentada"
select count(*) `Total de paises` from country;

-- Contar cuantos paises hay por region
select region `Nombre de Region`, count(*) `Paises por region` 
from country 
group by Region 
order by `Paises por region` desc;

-- Mostrar solo los que tiene mas de 10 paises
select region `Nombre de Region`, count(*) `Paises por region` 
from country 
group by Region 
having `Paises por region` > 10 
order by `Paises por region` desc;

-- Mostrar todos los paises menos los que no tienen su independencia
select region `Nombre de Region`, count(*) `Paises por region` 
from country 
where IndepYear is not null
group by Region 
having `Paises por region` > 10 
order by `Paises por region` desc;


-- Ejercicio:
-- Recuperar el total de poblacion que hay por Continente y region excluyendo aquellos paises que tengan una poblacion inferior al millon de habitantes
-- o que no hayan obtenido su independencia ordenandolo por el total de poblacion mostrando las regiones que tienen menos poblacion primero, y solo mostrar 
-- los registros con mas de 5 millones de habitantes
select Continent `Continente`,Region `region`, sum(Population) `Total de poblacion`
from country
where Population > 1000000 and IndepYear is not null
group by Continent, Region
having `Total de poblacion` > 5000000
order by `Total de poblacion`,region asc;
