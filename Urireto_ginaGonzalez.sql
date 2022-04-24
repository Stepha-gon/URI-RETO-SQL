use URIReto_GinaGonzalez
go
-- Reto Uri Gina Gonzalez

--1. 2615 - Expanding the Business

select distinct city from customers

--2.2622 - Legal Person

select customers.name as nombre
from customers,legal_person
where customers.id=legal_person.id_customers

--3. 2611 - Action Movies
select movies.id,movies.name
from movies, genres
where movies.id_genres=genres.id and genres .description='Action'

--4. 2623 - Categories with Various Products
select products.name,categories.name
from products 
inner join categories on products.id_categories=categories.id
where products.amount>100
and products .id_categories in (1,2,3,6,9)
order by categories.id

--5. 2988 - Cearense Championship

select 
(select teams.name 
    from teams
    where teams.id = team.id),
(select count(team_1) 
    from matches 
    where team_1 = team.id)+
    (select count(team_2) 
    from matches where 
    team_2 = team.id) as matches,

(select sum(case when team_2_goals > team_1_goals then 1 else 0 end) as victories 
    from teams inner join matches on teams.id = matches.team_2 
    where teams.id = team.id)+
    (select sum(case when team_1_goals > team_2_goals then 1 else 0 end) 
    from teams inner join matches on teams.id = matches.team_1 
    where teams.id = team.id) as victories,

(select sum(case when team_2_goals < team_1_goals then 1 else 0 end) as victories 
    from teams inner join matches on teams.id = matches.team_2 
    where teams.id = team.id)+
    (select sum(case when team_1_goals < team_2_goals then 1 else 0 end) 
    from teams inner join matches on teams.id = matches.team_1 
    where teams.id = team.id) as defeats,

(select sum(case when team_2_goals = team_1_goals then 1 else 0 end) as victories 
    from teams inner join matches on teams.id = matches.team_2 
    where teams.id = team.id)+
    (select sum(case when team_1_goals = team_2_goals then 1 else 0 end) 
    from teams inner join matches on teams.id = matches.team_1 
    where teams.id = team.id) as draws,

(select sum(case when team_2_goals > team_1_goals then 3 when team_2_goals = team_1_goals then 1 else 0 end) as victories 
    from teams inner join matches on teams.id = matches.team_2 
    where teams.id = team.id)+
    (select sum(case when team_1_goals > team_2_goals then 3 when team_1_goals = team_2_goals then 1 else 0 end) 
    from teams inner join matches  on teams.id = matches.team_1 
    where teams.id = team.id) as score


from teams team
order by score desc


--6. 2602 - Basic Select
select customers.name
from customers
where customers.state='RS'

--7. 2616 - No Rental

select customers.id,customers.name 
from customers
where not exists (select id_customers from locations where id_customers =customers.id)

--8 2742 - Richard's Multiverse
select life_registry.name, round((life_registry.omega * 1.618), 3) as " N" 
from life_registry  
join dimensions  on life_registry.dimensions_id = dimensions.id 
where dimensions.name in ('C875', 'C774') and life_registry.name like 'Richard%'
order by life_registry.omega asc

-- 9 3001 - Update sem Where
select name as type,
case type
when 'A'
then 20.0
when 'B'
then 70.0
when 'C'
then 530.5
end as type1
from products
order by type1,id desc;

--10. 2991 - Department Statistics
select departamento.nome,
(select count(lotacao) from empregado where lotacao = departamento.id),
(select avg(round((vencimiento.valor),2)) as media_salarial
from vencimiento 
where lotacao = departamento.id),
(select max(vencimiento.valor) as mayor salario
from vencimiento
where lotacao = departamento.id),
(select min(vencimiento.valor) as menor salario
from vencimiento
where lotacao = departamento.id)
from departamento
order by media_salarial



