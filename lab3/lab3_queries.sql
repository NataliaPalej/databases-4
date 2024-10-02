select * from actor CROSS JOIN address 
UNION 
select * from actor cross join address 
UNION 
select * from actor cross join address 
UNION 
select * from actor cross join address;

show full processlist;

# Explain query returns information about table
select * from actor;
explain select * from actor;
explain EXTENDED select * from actor cross join address;
explain select * from actor inner join film_actor on actor.actor_id = film_actor.actor_id;