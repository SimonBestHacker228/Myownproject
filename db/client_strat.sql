--DROP TABLE public.client_strat;
CREATE TABLE public.client_strat
(
  id integer NOT NULL,
  client__id integer NOT NULL,
  strat__id integer,
  interest double precision,
  CONSTRAINT client_strat_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.client_strat
  OWNER TO postgres;