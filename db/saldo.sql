--DROP TABLE public.saldo;
CREATE TABLE public.saldo
(
  id integer NOT NULL,
  account__id integer,
  instr_id integer,
  calc_date date,
  pos_beg integer,
  pos_end integer,
  var_marg double precision,
  ex_fee double precision,
  brok_fee double precision,
  fin_res double precision,
  CONSTRAINT saldo_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.saldo
  OWNER TO postgres;