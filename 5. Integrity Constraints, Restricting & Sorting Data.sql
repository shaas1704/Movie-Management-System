/* Integrity Constraints, Restricting & Sorting Data */

/* Like Operator */
SELECT * FROM Album WHERE alb_name LIKE 'a%';

/* Order By Clause*/
SELECT * FROM Track ORDER BY alb_name;

/* Check Constraint */
ALTER TABLE Track ADD CHECK (track_id>0);