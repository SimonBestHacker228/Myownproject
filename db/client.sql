--DROP TABLE public.client;
CREATE TABLE public.client
(
  name "varchar"(120),
  type integer,
  id integer NOT NULL,
  CONSTRAINT client_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.client
  OWNER TO postgres;