/*1. Create a Stored Procedure that will insert a new film into the film table with the
following arguments: title, description, release_year, language_id, rental_duration,
rental_rate, length, replace_cost, rating*/

SELECT *
FROM film;

INSERT INTO film(title, description, release_year, language_id, rental_duration,
rental_rate, length, replacement_cost, rating)

CREATE OR REPLACE PROCEDURE add_film(title VARCHAR(255), description TEXT, release_year year, language_id int2, rental_duration int2, rental_rate NUMERIC(4,2), length int2, replacement_cost NUMERIC(5,2), rating mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration,
rental_rate, length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

CALL add_film('Schnauzer POWER', 'Schnauzer sisters battle cockroach infestation of a busy Starbucks', '1989', '1', '7', '2.99', '90', '15.99', 'PG-13');

SELECT *
FROM FILM
WHERE title = 'Schnauzer POWER';


/*2. Create a Stored Function that will take in a category_id and return the number of
films in that category*/

SELECT *
FROM film_category;

SELECT COUNT(*)
FROM film_category fc  
WHERE category_id = 1;

CREATE OR REPLACE FUNCTION get_category_count(i integer)
RETURNS INTEGER 
LANGUAGE plpgsql 
AS $$
	DECLARE category_count INTEGER;
BEGIN 
	SELECT COUNT(*) INTO category_count
	FROM film_category 
	WHERE category_id = i;
	RETURN category_count;
END;
$$;

SELECT get_category_count(1);

