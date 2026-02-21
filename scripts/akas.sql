DROP TABLE IF EXISTS akas_staging CASCADE;

CREATE TABLE akas_staging (
    titleId TEXT,
    ordering TEXT,
    title TEXT,
    region TEXT,
    language TEXT,
    types TEXT,
    attributes TEXT,
    isOriginalTitle TEXT
);

copy akas_staging FROM 'C:/temp/akas.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');

DELETE FROM akas_staging
WHERE titleId = 'titleId'
   OR titleId = '"titleId"'
   OR titleId ILIKE '%titleId%';

DROP TABLE IF EXISTS akas CASCADE;

CREATE TABLE akas (
    titleId TEXT REFERENCES titles(tconst),
    ordering INTEGER,
    title TEXT,
    region TEXT,
    language TEXT,
    types TEXT[],
    attributes TEXT[],
    isOriginalTitle BOOLEAN,
    PRIMARY KEY (titleId, ordering)
);

INSERT INTO akas
SELECT
    titleId,
    ordering::integer,
    title,
    region,
    language,
    string_to_array(types, ','),
    string_to_array(attributes, ','),
    (isOriginalTitle = '1')::boolean
FROM akas_staging;

DROP TABLE IF EXISTS akas_staging CASCADE;
