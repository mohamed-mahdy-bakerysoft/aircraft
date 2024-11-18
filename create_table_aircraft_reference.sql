CREATE TABLE aircraft_reference (
    MANUFACTURER_MODEL_SERIES_CODE VARCHAR2(7), -- Code for manufacturer, model, and series (Positions 1-3: Manufacturer, 4-5: Model, 6-7: Series)
    MANUFACTURER_NAME VARCHAR2(30), -- Name of the aircraft manufacturer
    MODEL_NAME VARCHAR2(20), -- Name of the aircraft model and series
    TYPE_AIRCRAFT CHAR(1), -- Type of aircraft (e.g., Glider, Balloon, Fixed wing, etc.)
    TYPE_ENGINE VARCHAR2(2), -- Type of engine (e.g., Reciprocating, Turbo-prop, etc.)
    AIRCRAFT_CATEGORY_CODE CHAR(1), -- Aircraft category (e.g., Land, Sea, Amphibian)
    BUILDER_CERTIFICATION_CODE CHAR(1), -- Builder certification (e.g., Type Certificated, Light Sport)
    NUMBER_OF_ENGINES NUMBER(2), -- Number of engines on the aircraft
    NUMBER_OF_SEATS NUMBER(3), -- Maximum number of seats in the aircraft
    AIRCRAFT_WEIGHT_CODE CHAR(1), -- Aircraft weight category (e.g., Up to 12,499 pounds)
    CRUISING_SPEED NUMBER(4), -- Aircraft cruising speed in miles per hour
    TC_DATA_SHEET VARCHAR2(15), -- Type Certificate Data Sheet
    TC_DATA_HOLDER VARCHAR2(50) -- Type Certificate Data Holder
);

-- Adding comments to document the table structure
COMMENT ON TABLE aircraft_reference IS 'Table containing reference details for aircraft, including manufacturer, model, series codes, and related specifications.';
COMMENT ON COLUMN aircraft_reference.MANUFACTURER_MODEL_SERIES_CODE IS 'Code assigned to the aircraft manufacturer, model, and series.';
COMMENT ON COLUMN aircraft_reference.MANUFACTURER_NAME IS 'Name of the aircraft manufacturer.';
COMMENT ON COLUMN aircraft_reference.MODEL_NAME IS 'Name of the aircraft model and series.';
COMMENT ON COLUMN aircraft_reference.TYPE_AIRCRAFT IS 'Type of aircraft (e.g., Glider, Balloon, Fixed wing single engine, etc.).';
COMMENT ON COLUMN aircraft_reference.TYPE_ENGINE IS 'Type of engine (e.g., Reciprocating, Turbo-prop, Turbo-shaft, etc.).';
COMMENT ON COLUMN aircraft_reference.AIRCRAFT_CATEGORY_CODE IS 'Aircraft category (e.g., Land, Sea, Amphibian).';
COMMENT ON COLUMN aircraft_reference.BUILDER_CERTIFICATION_CODE IS 'Builder certification code (e.g., Type Certificated, Not Type Certificated, Light Sport).';
COMMENT ON COLUMN aircraft_reference.NUMBER_OF_ENGINES IS 'Number of engines on the aircraft.';
COMMENT ON COLUMN aircraft_reference.NUMBER_OF_SEATS IS 'Maximum number of seats in the aircraft.';
COMMENT ON COLUMN aircraft_reference.AIRCRAFT_WEIGHT_CODE IS 'Aircraft weight category (e.g., Up to 12,499 pounds, 20,000 and over, etc.).';
COMMENT ON COLUMN aircraft_reference.CRUISING_SPEED IS 'Aircraft average cruising speed in miles per hour.';
COMMENT ON COLUMN aircraft_reference.TC_DATA_SHEET IS 'Type Certificate Data Sheet.';
COMMENT ON COLUMN aircraft_reference.TC_DATA_HOLDER IS 'Type Certificate Data Holder.';
