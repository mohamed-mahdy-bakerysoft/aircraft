CREATE TABLE AIRCRAFT_TYPE (
    TYPE_AIRCRAFT CHAR(1),
    DESCRIPTION VARCHAR2(100)
);

INSERT INTO AIRCRAFT_TYPE VALUES ('1','Glider');                    -- 1 - Glider
INSERT INTO AIRCRAFT_TYPE VALUES ('2','Balloon');                   -- 2 - Balloon
INSERT INTO AIRCRAFT_TYPE VALUES ('3','Blimp/Derigible');           -- 3 - Blimp/Dirigible
INSERT INTO AIRCRAFT_TYPE VALUES ('4','Fixed wing single engine');  -- 4 - Fixed wing single engine
INSERT INTO AIRCRAFT_TYPE VALUES ('5','Fixed wing multi engine');   -- 5 - Fixed wing multi engine
INSERT INTO AIRCRAFT_TYPE VALUES ('6','Rotorcraft');                -- 6 - Rotorcraft
INSERT INTO AIRCRAFT_TYPE VALUES ('7','Weight-shift-control');      -- 7 - Weight-shift-control
INSERT INTO AIRCRAFT_TYPE VALUES ('8','Powered Parachute');         -- 8 - Powered Parachute
INSERT INTO AIRCRAFT_TYPE VALUES ('9','Gyroplane');                 -- 9 - Gyroplane
INSERT INTO AIRCRAFT_TYPE VALUES ('H','Hybrid Lift');               -- H - Hybrid Lift
INSERT INTO AIRCRAFT_TYPE VALUES ('O','Other');                     -- O - Other

ALTER TABLE AIRCRAFT_TYPE 
   ADD CONSTRAINT PK_AIRCRAFT_TYPE 
   PRIMARY KEY (TYPE_AIRCRAFT);
