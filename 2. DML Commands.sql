SELECT * FROM track LIMIT 5;

SELECT * FROM track LIMIT 2 OFFSET 8;

SELECT UPPER(art_name), LOWER(location) FROM artist WHERE agent_id=1;

INSERT INTO track VALUES (17, 'Kaise Jiyun (Acoustic)', 1, 1);
INSERT INTO track VALUES (18, 'Aaoge Tum Kabhi', 1, 1);
INSERT INTO track VALUES (19, 'Buniyaad', 4, 2);

UPDATE track SET track_name='Bandey' WHERE track_id=18 AND art_id=1;

DELETE FROM track WHERE track_name='Buniyaad';