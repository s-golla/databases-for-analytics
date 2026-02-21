DROP TABLE IF EXISTS crew_staging CASCADE;

CREATE TABLE crew_staging (
    tconst TEXT,
    directors TEXT,
    writers TEXT
);

copy crew_staging FROM 'C:/temp/title.crew.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');

DELETE FROM crew_staging c
WHERE NOT EXISTS (
    SELECT 1
    FROM titles t
    WHERE t.tconst = c.tconst
);

DROP TABLE IF EXISTS crew CASCADE;

CREATE TABLE crew (
    tconst TEXT PRIMARY KEY REFERENCES titles(tconst),
    directors TEXT[],
    writers TEXT[]
);

INSERT INTO crew
SELECT
    tconst,
    string_to_array(directors, ','),
    string_to_array(writers, ',')
FROM crew_staging;

DROP TABLE IF EXISTS crew_staging CASCADE;
