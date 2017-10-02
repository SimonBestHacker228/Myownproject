--DROP TABLE public.account;
CREATE TABLE public.account
(
  id integer NOT NULL,
  cod "varchar"(30),
  strat__id integer,
  CONSTRAINT account_pkey PRIMARY KEY (id),
  CONSTRAINT strat_id_fkey FOREIGN KEY (id)
      REFERENCES public.account (strat__id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT account_strat__id_key UNIQUE (strat__id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.account
  OWNER TO postgres;