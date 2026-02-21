DROP TABLE IF EXISTS ratings_staging CASCADE;

CREATE TABLE ratings_staging (
    tconst TEXT,
    averageRating TEXT,
    numVotes TEXT
);

copy ratings_staging FROM 'C:/temp/title.ratings.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');

DELETE FROM ratings_staging
WHERE tconst = 'tconst'
   OR tconst = '"tconst"'
   OR tconst ILIKE '%tconst%';

DROP TABLE IF EXISTS ratings CASCADE;

CREATE TABLE ratings (
    tconst TEXT PRIMARY KEY REFERENCES titles(tconst),
    averageRating NUMERIC(3,1),
    numVotes INTEGER
);

INSERT INTO ratings
SELECT
    tconst,
    NULLIF(averageRating, '\N')::numeric(3,1),
    NULLIF(numVotes, '\N')::integer
FROM ratings_staging;

DROP TABLE IF EXISTS ratings_staging CASCADE;
