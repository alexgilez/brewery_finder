BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO brewery
VALUES(1,1,'name','823498237948','2398472938@gmail.com','2384 main st','hsakdhfdsjkfhkajshf','sdajfhkajhf','akjdhfkajsdf','skajdhfkjsdh');

SELECT *
FROM brewery;

COMMIT TRANSACTION;
