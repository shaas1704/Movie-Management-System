/* TCL Commands - Checkpoint 1*/

DELETE FROM album WHERE alb_id=1;
ROLLBACK;

SAVEPOINT sp;
DELETE FROM album WHERE alb_id=2;
ROLLBACK TO SAVEPOINT sp;

INSERT INTO USER VALUES(6, 'Siddharth', 'siddharthsubra@gmail.com', 'subra', 'subra123', 'Pop/Indie');
DELETE FROM USER WHERE user_id=6;
COMMIT;