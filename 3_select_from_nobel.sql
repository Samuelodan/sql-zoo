-- 1. display the Nobel prizes for 1950
SELECT
  yr,
  subject,
  winner
FROM nobel
WHERE yr = 1950;

-- 2. Show who won the 1962 prize for literature.
SELECT winner
FROM nobel
WHERE
  yr = 1962
  AND subject = 'literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize
SELECT
  yr,
  subject
FROM nobel
WHERE winner LIKE 'albert einstein';

-- 4. Give the name of the 'peace' winners since the year 2000, including 2000
SELECT winner
FROM nobel
WHERE
  subject LIKE 'peace'
  AND yr >= 2000;

/* 5. Show all details (yr, subject, winner) of the literature prize winners for
      1980 to 1989 inclusive. */
SELECT *
FROM nobel
WHERE yr BETWEEN 1980 AND 1989
  AND subject LIKE 'literature';

/* 6. Show all details of the presidential winners:
      - Theodore Roosevelt,
      - Thomas Woodrow Wilson,
      - Jimmy Carter,
      - Barack Obama. */
SELECT *
FROM nobel
WHERE
  winner IN(
    'theodore roosevelt',
    'woodrow wilson',
    'jimmy carter',
    'barack obama'
  );

-- 7. Show all the winners with first name 'John'
SELECT winner
FROM nobel
WHERE winner LIKE 'john_%';

/* 8. Show the year, subject, and name of physics winners for 1980 together with
      the chemistry winners for 1984. */
SELECT *
FROM nobel
WHERE
  (subject LIKE 'physics' AND yr = 1980)
  OR (subject LIKE 'chemistry' AND yr = 1984);

/* 9. Show the year, subject, and name of winners for 1980 excluding chemistry
      and medicine */
SELECT *
FROM nobel
WHERE
  yr = 1980
  AND subject NOT IN('chemistry', 'medicine');
