CREATE TABLE Book(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(150),
  cover_state VARCHAR(200),
);

CREATE TABLE Source (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
);

