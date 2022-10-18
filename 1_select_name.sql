-- 1. Find the country that start with 'Y'
SELECT name
FROM world
WHERE name LIKE 'y%';

-- 2. Find the countries that end with 'y'
SELECT name
FROM world
WHERE name LIKE '%y';

-- 3. Find the countries that contain the letter 'x'
SELECT name
FROM world
WHERE name LIKE '%x%';

-- 4. Find the countries that end with 'land'
SELECT name
FROM world
WHERE name LIKE '%land';

-- 5. Find he countries that start with 'C' and end in 'ia'
SELECT name
FROM world
WHERE
  name LIKE 'c%'
  AND name LIKE '%ia';

-- 6. Find the country that has 'oo' in the name
SELECT name
FROM world
WHERE name LIKE '%oo%';

-- 7. Find the countries that have three or more A's in them
SELECT name
FROM world
WHERE name LIKE '%a%a%a%';

-- 8. FInd the countries that have 't' as the second character
SELECT name
FROM world
WHERE name LIKE '_t%';

-- 9. Find the countries that have two "o" characters separated by two others
SELECT name
FROM world
WHERE name LIKE '%o__o%';

-- 10. Find the countries that have exactly four characters
SELECT name
FROM world
WHERE LEN(name) = 4;

-- 11. Find the country where the name is the capital city
SELECT name
FROM world
WHERE name = capital;

-- 12. Find the country where the capital is the country plus "City"
SELECT name
FROM world
WHERE capital = CONCAT(name, ' city');

/* 13. Find the capital and the name where the capital includes the name of the
       country */
SELECT
  capital,
  name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');
-- or: WHERE capital LIKE '%' + name + '%';

/* 14. Find the capital and the name where the capital is an extension of name
       of the country */

