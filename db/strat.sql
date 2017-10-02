--DROP TABLE public.strat;
CREATE TABLE public.strat
(
  id integer NOT NULL,
  name "varchar"(120),
  comment "varchar"(200),
  CONSTRAINT strat_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.strat
  OWNER TO postgres;