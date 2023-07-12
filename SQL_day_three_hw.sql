--1. List all customers who live in Texas (use JOINs)
select c.first_name, c.last_name, c.address_id, a.district from customer as c
inner join address as a
on c.address_id = a.address_id
where a.district = 'Texas';
--2. Get all payments above $6.99 with the Customer's Full Name
select c.customer_id, c.first_name, c.last_name, p.amount from customer as c
left join payment as p
on c.customer_id = p.customer_id
where amount > 6.99;
--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (select customer_id from payment where amount > 175);
--4. List all customers that live in Nepal (use the city table)
select cu.first_name, cu.last_name, ci.city, co.country from customer as cu
inner join address as a on cu.address_id = a.address_id
inner join city as ci on a.city_id = ci.city_id
inner join country as co on ci.country_id = co.country_id
where co.country = 'Nepal';
--5. Which staff member had the most transactions?
select s.first_name, s.last_name, COUNT(rental_id) from staff as s
left join rental as r on s.staff_id = r.staff_id
group by s.first_name, s.last_name;
--6. How many movies of each rating are there?
select rating, COUNT(title) from film
group by rating;
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select * from customer where customer_id in (select customer_id from payment where amount > 6.99);
--8. How many free rentals did our stores give away?
select COUNT(amount) as free_rentals from payment where amount = 0;