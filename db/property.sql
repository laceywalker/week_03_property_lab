DROP TABLE IF EXISTS property_listings;

CREATE TABLE property_listings (
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT4,
  rental_status VARCHAR(255),
  year_built INT2
);




-- ?this is database schema - when changes are made to this file, must run the psql -d property -f db/property.sql
-- file again, but will recreate database every time this is run
