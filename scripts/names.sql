--run this script in psql to create the names table and load data from the names.tsv file
-- Make sure to update the file path in the copy command to match the location of your names.tsv file
-- Note: The names.tsv file should be in the same format as the one provided by IMDb, with columns:
-- nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles
-- The script will create a staging table to load the raw data, clean it, and then insert it into the final names table with appropriate data types and array handling for professions and known names.
-- After running this script, you will have a names table ready for querying in your PostgreSQL database.
-- Make sure to have the necessary permissions to create tables and load data in your database.

-- Run below command in powershell to execute the script and make sure to update the file path to match the location of your names.sql file
-- Get-Content "C:\temp\name.basics.tsv" -Encoding UTF8 -TotalCount 2500 | Set-Content "C:\temp\names.tsv" -Encoding UTF8

DROP TABLE IF EXISTS names_staging CASCADE;

CREATE TABLE names_staging (
    nconst TEXT,
    primaryName TEXT,
    birthYear TEXT,
    deathYear TEXT,
    primaryProfession TEXT,
    knownForTitles TEXT
);

copy names_staging FROM 'C:/temp/name.basics.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');

DELETE FROM names_staging
WHERE nconst = 'nconst'
   OR nconst = '"nconst"'
   OR nconst ILIKE '%nconst%';

DROP TABLE IF EXISTS names CASCADE;

CREATE TABLE names (
    nconst TEXT PRIMARY KEY,
    primaryName TEXT,
    birthYear SMALLINT,
    deathYear SMALLINT,
    primaryProfession TEXT[],
    knownForTitles TEXT[]
);

INSERT INTO names
SELECT
    nconst,
    primaryName,
    NULLIF(birthYear, '\N')::smallint,
    NULLIF(deathYear, '\N')::smallint,
    string_to_array(primaryProfession, ','),
    string_to_array(knownForTitles, ',')
FROM names_staging;

DROP TABLE names_staging CASCADE;
