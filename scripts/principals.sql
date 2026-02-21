DROP TABLE IF EXISTS principals_staging CASCADE;

CREATE TABLE principals_staging (
    tconst TEXT,
    ordering TEXT,
    nconst TEXT,
    category TEXT,
    job TEXT,
    characters TEXT
);

copy principals_staging FROM 'C:/temp/principals.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');

DELETE FROM principals_staging
WHERE tconst = 'tconst'
   OR tconst = '"tconst"'
   OR tconst ILIKE '%tconst%';;

DROP TABLE IF EXISTS principals CASCADE;

CREATE TABLE principals (
    tconst TEXT REFERENCES titles(tconst),
    ordering INTEGER,
    nconst TEXT REFERENCES names(nconst),
    category TEXT,
    job TEXT,
    characters TEXT,
    PRIMARY KEY (tconst, ordering)
);

INSERT INTO principals
SELECT
    tconst,
    ordering::integer,
    nconst,
    category,
    job,
    characters
FROM principals_staging;

DROP TABLE IF EXISTS principals_staging CASCADE;
