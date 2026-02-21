DROP TABLE IF EXISTS titles_staging CASCADE;

CREATE TABLE titles_staging (
    tconst TEXT,
    titleType TEXT,
    primaryTitle TEXT,
    originalTitle TEXT,
    isAdult TEXT,
    startYear TEXT,
    endYear TEXT,
    runtimeMinutes TEXT,
    genres TEXT
);


copy titles_staging FROM 'C:/temp/title.basics.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');


DELETE FROM titles_staging
WHERE tconst = 'tconst'
   OR tconst = '"tconst"'
   OR tconst ILIKE '%tconst%';

DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE titles (
    tconst TEXT PRIMARY KEY,
    titleType TEXT,
    primaryTitle TEXT,
    originalTitle TEXT,
    isAdult BOOLEAN,
    startYear SMALLINT,
    endYear SMALLINT,
    runtimeMinutes INTEGER,
    genres TEXT[]
);


INSERT INTO titles
SELECT
    tconst,
    titleType,
    primaryTitle,
    originalTitle,
    (isAdult = '1')::boolean,
    NULLIF(startYear, '\N')::smallint,
    NULLIF(endYear, '\N')::smallint,
    NULLIF(runtimeMinutes, '\N')::integer,
    string_to_array(genres, ',')
FROM titles_staging;

DROP TABLE IF EXISTS titles_staging CASCADE;
