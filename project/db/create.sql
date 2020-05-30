DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'postgres') THEN

      CREATE ROLE postgres LOGIN PASSWORD 'postgres';
   END IF;
END
$do$;
CREATE DATABASE users_dev;
GRANT ALL PRIVILEGES ON DATABASE users_dev TO postgres;
CREATE DATABASE users_test;
GRANT ALL PRIVILEGES ON DATABASE users_test TO postgres;
