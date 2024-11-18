
DROP TABLE AIRCRAFT_REGISTRATION;

CREATE TABLE aircraft_registration (
    N_NUMBER VARCHAR2(5), -- Identification number assigned to the aircraft
    SERIAL_NUMBER VARCHAR2(30), -- Complete aircraft serial number assigned by the manufacturer
    MFR_MDL_CODE VARCHAR2(7), -- Code for manufacturer, model, and series
    ENG_MFR_MDL_CODE VARCHAR2(5), -- Code for engine manufacturer and model
    YEAR_MFR DATE, -- Year the aircraft was manufactured
    TYPE_REGISTRANT CHAR(1), -- Type of registrant (1-Individual, 2-Partnership, etc.)
    REGISTRANT_NAME VARCHAR2(50), -- Name of the registrant
    STREET1 VARCHAR2(33), -- Street address from the application or updates
    STREET2 VARCHAR2(33), -- Additional street address
    CITY VARCHAR2(18), -- City name from the application or updates
    STATE CHAR(2), -- State code from the application or updates
    ZIP_CODE VARCHAR2(10), -- Postal ZIP code
    REGION CHAR(1), -- FAA Region code
    COUNTY_CODE CHAR(3), -- County code
    COUNTRY_CODE CHAR(2), -- Country code
    LAST_ACTION_DATE DATE, -- Date of the last recorded activity (YYYY/MM/DD format)
    CERT_ISSUE_DATE DATE, -- Certification issue date (YYYY/MM/DD format)
    CERTIFICATION VARCHAR2(25), -- Certification type (Airworthiness classification)
    TYPE_AIRCRAFT CHAR(1), -- Type of aircraft (1-Glider, 2-Balloon, etc.)
    TYPE_ENGINE CHAR(2), -- Type of engine (1-Reciprocating, 2-Turbo-prop, etc.)
    STATUS_CODE CHAR(2), -- Status of the aircraft registration
    MODE_S_CODE VARCHAR2(8), -- Aircraft transponder code
    FRACTIONAL_OWNERSHIP CHAR(1), -- Fractional ownership indicator
    AIRWORTHINESS_DATE DATE, -- Date of airworthiness
    OTHER_NAME1 VARCHAR2(50), -- 1st co-owner or partnership name
    OTHER_NAME2 VARCHAR2(50), -- 2nd co-owner or partnership name
    OTHER_NAME3 VARCHAR2(50), -- 3rd co-owner or partnership name
    OTHER_NAME4 VARCHAR2(50), -- 4th co-owner or partnership name
    OTHER_NAME5 VARCHAR2(50), -- 5th co-owner or partnership name
    EXPIRATION_DATE DATE, -- Registration expiration date
    UNIQUE_ID VARCHAR2(8), -- Unique identification number
    KIT_MFR VARCHAR2(30), -- Kit manufacturer name
    KIT_MODEL VARCHAR2(20), -- Kit model name
    MODE_S_CODE_HEX VARCHAR2(10) -- Mode S Code in hexadecimal format
);

-- Adding comments to the table
COMMENT ON TABLE aircraft_registration IS 'Table containing U.S. civil aircraft registration details as maintained by the FAA.';
COMMENT ON COLUMN aircraft_registration.N_NUMBER IS 'Identification number assigned to the aircraft.';
COMMENT ON COLUMN aircraft_registration.SERIAL_NUMBER IS 'Complete aircraft serial number assigned by the manufacturer.';
COMMENT ON COLUMN aircraft_registration.MFR_MDL_CODE IS 'Code for manufacturer, model, and series of the aircraft.';
COMMENT ON COLUMN aircraft_registration.ENG_MFR_MDL_CODE IS 'Code for engine manufacturer and model.';
COMMENT ON COLUMN aircraft_registration.YEAR_MFR IS 'Year the aircraft was manufactured.';
COMMENT ON COLUMN aircraft_registration.TYPE_REGISTRANT IS 'Type of registrant (e.g., Individual, Corporation, Government).';
COMMENT ON COLUMN aircraft_registration.REGISTRANT_NAME IS 'Name of the registrant.';
COMMENT ON COLUMN aircraft_registration.STREET1 IS 'Primary street address of the registrant.';
COMMENT ON COLUMN aircraft_registration.STREET2 IS 'Additional street address of the registrant.';
COMMENT ON COLUMN aircraft_registration.CITY IS 'City name of the registrant.';
COMMENT ON COLUMN aircraft_registration.STATE IS 'State code of the registrant.';
COMMENT ON COLUMN aircraft_registration.ZIP_CODE IS 'ZIP code of the registrant.';
COMMENT ON COLUMN aircraft_registration.REGION IS 'FAA Region code where the registrant is located.';
COMMENT ON COLUMN aircraft_registration.COUNTY_CODE IS 'County code of the registrant.';
COMMENT ON COLUMN aircraft_registration.COUNTRY_CODE IS 'Country code of the registrant.';
COMMENT ON COLUMN aircraft_registration.LAST_ACTION_DATE IS 'Date of the last recorded action in the registration.';
COMMENT ON COLUMN aircraft_registration.CERT_ISSUE_DATE IS 'Certification issue date.';
COMMENT ON COLUMN aircraft_registration.CERTIFICATION IS 'Type of certification requested or issued.';
COMMENT ON COLUMN aircraft_registration.TYPE_AIRCRAFT IS 'Type of aircraft (e.g., Fixed-wing, Rotorcraft).';
COMMENT ON COLUMN aircraft_registration.TYPE_ENGINE IS 'Type of engine used by the aircraft.';
COMMENT ON COLUMN aircraft_registration.STATUS_CODE IS 'Current status of the aircraft registration.';
COMMENT ON COLUMN aircraft_registration.MODE_S_CODE IS 'Transponder code of the aircraft.';
COMMENT ON COLUMN aircraft_registration.FRACTIONAL_OWNERSHIP IS 'Indicates whether the aircraft has fractional ownership.';
COMMENT ON COLUMN aircraft_registration.AIRWORTHINESS_DATE IS 'Date the airworthiness certificate was issued.';
COMMENT ON COLUMN aircraft_registration.OTHER_NAME1 IS 'First co-owner or partnership name.';
COMMENT ON COLUMN aircraft_registration.OTHER_NAME2 IS 'Second co-owner or partnership name.';
COMMENT ON COLUMN aircraft_registration.OTHER_NAME3 IS 'Third co-owner or partnership name.';
COMMENT ON COLUMN aircraft_registration.OTHER_NAME4 IS 'Fourth co-owner or partnership name.';
COMMENT ON COLUMN aircraft_registration.OTHER_NAME5 IS 'Fifth co-owner or partnership name.';
COMMENT ON COLUMN aircraft_registration.EXPIRATION_DATE IS 'Date when the aircraft registration expires.';
COMMENT ON COLUMN aircraft_registration.UNIQUE_ID IS 'Unique identifier for the aircraft.';
COMMENT ON COLUMN aircraft_registration.KIT_MFR IS 'Name of the kit manufacturer.';
COMMENT ON COLUMN aircraft_registration.KIT_MODEL IS 'Name of the kit model.';
COMMENT ON COLUMN aircraft_registration.MODE_S_CODE_HEX IS 'Mode S code in hexadecimal format.';

-- Foreign Key Type Aircraft
ALTER TABLE AIRCRAFT_REGISTRATION 
   ADD CONSTRAINT FK_AIRCRAFT_TYPE FOREIGN 
   KEY (type_aircraft) 
   REFERENCES AIRCRAFT_TYPE (type_aircraft);