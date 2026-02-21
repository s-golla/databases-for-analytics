DROP TABLE IF EXISTS episodes_staging CASCADE;

CREATE TABLE episodes_staging (
    tconst TEXT,
    parentTconst TEXT,
    seasonNumber TEXT,
    episodeNumber TEXT
);

copy episodes_staging FROM 'C:/temp/title.episode.tsv' WITH (FORMAT text, DELIMITER E'\t', NULL '\N');

DELETE FROM episodes_staging e
WHERE NOT EXISTS (
    SELECT 1
    FROM titles t
    WHERE t.tconst = e.tconst
);

DROP TABLE IF EXISTS episodes CASCADE;

CREATE TABLE episodes (
    tconst TEXT PRIMARY KEY REFERENCES titles(tconst),
    parentTconst TEXT REFERENCES titles(tconst),
    seasonNumber INTEGER,
    episodeNumber INTEGER
);

INSERT INTO episodes
SELECT
    tconst,
    parentTconst,
    NULLIF(seasonNumber, '\N')::integer,
    NULLIF(episodeNumber, '\N')::integer
FROM episodes_staging;

DROP TABLE IF EXISTS episodes_staging CASCADE;
