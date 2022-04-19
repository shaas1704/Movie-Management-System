/* Aggregate Functions */

/* COUNT() */
SELECT COUNT(*) 
FROM track 
WHERE alb_id=3;

/* SUM() */
SELECT SUM(followers)
FROM artist
WHERE art_id>2;

/* MIN() */
SELECT MIN(track_name)
FROM track
WHERE art_id<3;

/* MAX() */
SELECT MAX(track_name)
FROM track
WHERE art_id<3;

/* AVG() */
SELECT AVG(followers)
FROM artist;