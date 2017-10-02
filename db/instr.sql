--DROP TABLE public.instr;
CREATE TABLE public.instr
(
  id integer NOT NULL,
  calc_date date,
  isin "varchar"(12),
  price double precision,
  tick double precision,
  tick_price double precision,
  currency "varchar"(3),
  nkd double precision,
  CONSTRAINT instr_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.instr
  OWNER TO postgres;