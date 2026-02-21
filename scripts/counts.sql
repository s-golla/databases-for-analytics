SELECT
    relname AS table_name,
	'TSV' AS Format,
    reltuples::bigint AS row_count,
    (SELECT count(*)
     FROM pg_attribute
     WHERE attrelid = c.oid
       AND attnum > 0
       AND NOT attisdropped) AS column_count
FROM
    pg_class c
JOIN
    pg_namespace n ON n.oid = c.relnamespace
WHERE
    c.relkind = 'r'                -- 'r' limits the search to ordinary tables
    AND n.nspname = 'public'       -- Filter by your schema (usually 'public')
ORDER BY
    reltuples DESC;
