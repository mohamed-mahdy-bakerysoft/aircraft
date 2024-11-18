

-- Drop the existing table if it exists
DROP TABLE EXT_AIRCRAFT_REGISTRATION;

-- Validate Object Storage access and generate table list
SELECT *  
FROM DBMS_CLOUD.LIST_OBJECTS(
    'OBJECT_STORAGE',
    'https://objectstorage.us-ashburn-1.oraclecloud.com/n/idm7h9ahfhkg/b/AircraftRegistration/o/'
)
WHERE OBJECT_NAME = 'MASTER.txt';

BEGIN
    DBMS_CLOUD.CREATE_EXTERNAL_TABLE(
        table_name      => 'EXT_AIRCRAFT_REGISTRATION',
        credential_name => 'OBJECT_STORAGE',
        file_uri_list   => '
            https://objectstorage.us-ashburn-1.oraclecloud.com/n/idm7h9ahfhkg/b/AircraftRegistration/o/MASTER.txt
        ',
        column_list     => '
            N_NUMBER VARCHAR2(5),         -- Identification number assigned to the aircraft
            SERIAL_NUMBER VARCHAR2(30),   -- Complete aircraft serial number assigned by the manufacturer
            MFR_MDL_CODE VARCHAR2(7),     -- Code for manufacturer, model, and series
            ENG_MFR_MDL_CODE VARCHAR2(5), -- Code for engine manufacturer and model
            YEAR_MFR VARCHAR2(4),          -- Year the aircraft was manufactured
            TYPE_REGISTRANT CHAR(1),      -- Type of registrant (1-Individual, 2-Partnership, etc.)
            REGISTRANT_NAME VARCHAR2(50), -- Name of the registrant
            STREET1 VARCHAR2(33),         -- Street address from the application or updates
            STREET2 VARCHAR2(33),         -- Additional street address
            CITY VARCHAR2(18),            -- City name from the application or updates
            STATE CHAR(2),                -- State code from the application or updates
            ZIP_CODE VARCHAR2(10),        -- Postal ZIP code
            REGION CHAR(1),               -- FAA Region code
            COUNTY_CODE CHAR(3),          -- County code
            COUNTRY_CODE CHAR(2),         -- Country code
            LAST_ACTION_DATE DATE,        -- Date of the last recorded activity (YYYY/MM/DD format)
            CERT_ISSUE_DATE VARCHAR2(8),         -- Certification issue date (YYYY/MM/DD format)
            CERTIFICATION VARCHAR(10),        -- Certification type (Airworthiness classification)
            TYPE_AIRCRAFT CHAR(1),        -- Type of aircraft (1-Glider, 2-Balloon, etc.)
            TYPE_ENGINE CHAR(2),          -- Type of engine (1-Reciprocating, 2-Turbo-prop, etc.)
            STATUS_CODE CHAR(2),          -- Status of the aircraft registration
            MODE_S_CODE VARCHAR2(8),      -- Aircraft transponder code
            FRACTIONAL_OWNERSHIP CHAR(1), -- Fractional ownership indicator
            AIRWORTHINESS_DATE VARCHAR2(8),      -- Date of airworthiness
            OTHER_NAME1 VARCHAR2(50),     -- 1st co-owner or partnership name
            OTHER_NAME2 VARCHAR2(50),     -- 2nd co-owner or partnership name
            OTHER_NAME3 VARCHAR2(50),     -- 3rd co-owner or partnership name
            OTHER_NAME4 VARCHAR2(50),     -- 4th co-owner or partnership name
            OTHER_NAME5 VARCHAR2(50),     -- 5th co-owner or partnership name
            EXPIRATION_DATE VARCHAR2(8),         -- Registration expiration date
            UNIQUE_ID VARCHAR2(8),        -- Unique identification number
            KIT_MFR VARCHAR2(30),         -- Kit manufacturer name
            KIT_MODEL VARCHAR2(20),       -- Kit model name
            MODE_S_CODE_HEX VARCHAR2(10)  -- Mode S Code in hexadecimal format
        ',
        format => JSON_OBJECT(
            'type' value 'CSV',
            'skipHeaders' value '1',
            'delimiter' value ',',
            'dateformat' value 'yyyymmdd',
            'ignoremissingcolumns' value 'true',
            'rejectlimit' value 'unlimited')         
    );
END;
/

-- Validate Data Load
-- SELECT VALIDATE$<#>_LOG for Errors - scroll to the bottom of the table
-- SELECT VALIDATE$<#>_BAD for rejected rows
BEGIN
    DBMS_CLOUD.VALIDATE_EXTERNAL_TABLE(
        table_name    => 'EXT_AIRCRAFT_REGISTRATION',
        stop_on_error => FALSE
    );
END;
/

-- Verify the data load
SELECT COUNT(*) "EXT_AIRCRAFT_REGISTRATION"
FROM EXT_AIRCRAFT_REGISTRATION;


