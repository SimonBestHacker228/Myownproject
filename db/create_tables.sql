--DROP TABLE public.currspotdeals;
CREATE TABLE public.currspotdeals
(
NODE "varchar"(60),	
DOC_DATE Date, 
DOC_TIME Time,	
DOC_NO "varchar"(12),	
DOC_TYPE_ID "varchar"(12),
SENDER_ID "varchar"(12),
SENDER_NAME "varchar"(30),
RECEIVER_ID "varchar"(12),
REMARKS "varchar"(120),
SIGNAUTHOR "char",	
ReportDate Date not null,
FirmId "varchar"(12) not null,
FirmName "varchar"(120) not null,
FirmNameEN "varchar"(120),
ClearingFirmId "varchar"(12) not null,
ClearingFirmName "varchar"(120) not null,
ClearingFirmNameEN "varchar"(120),
ExtSettleCode "varchar"(20) not null,
ExtTradeCode "varchar"(20) not null,
ExtTradeCodeType "varchar"(10) not null,
AddSession "varchar"(1) not null,
SessionName "varchar"(30) not null,
SessionNameEN "varchar"(30) not null,	
CurrencyId "varchar"(4) not null,
CurrencyName "varchar"(30) not null,
CurrencyNameEN "varchar"(30),
CoCurrencyId "varchar"(4) not null,
CoCurrencyName "varchar"(30) not null,
CoCurrencyNameEN "varchar"(30),
SecurityId "varchar"(12) not null,
SecShortName "varchar"(10) not null,
FaceValue Numeric not null,
SettleDate Date not null,	
TradeGroup "varchar"(1) not null,
MainSecurityId "varchar"(12)not null,
MainSecShortName "varchar"(10) not null,
TradeNo	Numeric not null,
BuySell	"varchar"(1) not null,
OrderNo	Numeric not null,
TradeDeriv "varchar"(1) not null,
TradeTime Time not null,	
TradeType "varchar"(1) not null,
Decimals Numeric not null,
Price Numeric not null,
Quantity Numeric not null,
Value Numeric not null,
CPFirmId "varchar"(12),
Period "varchar"(1) not null,
SettleCode "varchar"(12) not null,
UserId "varchar"(12) not null,
UserExchangeId "varchar"(4) not null,
BrokerRef "varchar"(20),
ExtRef "varchar"(12),
ExchComm Numeric,
ITSComm Numeric,
ClrComm Numeric,
SumComm Numeric,
TrdAccId "varchar"(12) not null,
ClientCode "varchar"(12),
Details	"varchar"(20),
SubDetails "varchar"(20),
RepoTradeNo Numeric,
BoardId	"varchar"(4) not null,
BoardName "varchar"(30) not null,
BoardNameEN "varchar"(30)
)
--DROP TABLE public.stockdeals;
CREATE TABLE public.stockdeals
(
NODE "varchar"(60),	
DOC_DATE Date, 
DOC_TIME Time,	
DOC_NO "varchar"(12),	
DOC_TYPE_ID "varchar"(12),
SENDER_ID "varchar"(12),
SENDER_NAME "varchar"(30),
RECEIVER_ID "varchar"(12),
REMARKS "varchar"(120),	
ReportDate Date not null,
Weekday "varchar"(12) not null,
MainFirmId "varchar"(12) not null,
FirmID "varchar"(12) not null,
CurrencyId "varchar"(4) not null,
CurrencyName "varchar"(30) not null,
InfType Numeric(1,0) not null,
ClearingType "varchar"(1),
Session Numeric(1,0) not null,
SettleDate Date not null,
InstrType "varchar"(1),
BoardId	"varchar"(4) not null,
BoardName "varchar"(30) not null,
SecurityId "varchar"(12) not null,
ISIN "varchar"(12),
SecShortName "varchar"(10) not null,
PriceType "varchar"(4),
RecNo Numeric(11,0) not null,
TradeNo Numeric(20,0) not null,
TradeDate Date not null,
TradeTime Time not null,	
BuySell	"varchar"(1) not null,
SettleCode "varchar"(12) not null,
Decimals Numeric(1,0) not null,
Price Numeric(20,6),
Quantity Numeric(20,0) not null,
Value Numeric(20,2),
DepoRate Numeric(20,6),
AccInt Numeric(20,2),
Amount Numeric(20,2),
Balance Numeric(20,0),
Sum1 Numeric(20,2),
Sum2 Numeric(20,2),
ExchComm Numeric(20,2),
ClrComm Numeric(20,2),
ITSComm Numeric(20,2),
TrdAccId "varchar"(12) not null,
ClientDetails "varchar"(41),
CPFirmId "varchar"(12),
CPFirmShortName "varchar"(30),
Price2 Numeric(20,6),
Payoff Numeric(20,6),
RepoPart Numeric,
RepoPeriod Numeric(11,0),
ReportNo Numeric(20,0),
ReportTime Time,
SettleTime Time,
ClientCode "varchar"(12),
DueDate Date not null,
Type Numeric,
SystemRef "varchar"(12) 
)
--DROP TABLE public.tabletypes;
CREATE TABLE public.tabletypes
(
table_name "varchar"(30),
node "varchar"(30),	
attrib "varchar"(30),	
remark "varchar"(200),
requare "varchar"(1),
field_type "varchar"(30),
sort_num numeric
)
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
  
--DROP TABLE public.deals;
CREATE TABLE public.deals
(
  id integer NOT NULL,
  instr_id integer,
  acc_id integer,
  deal_date date,
  buysell "char",
  isin "varchar"(12),
  vol integer,
  amount double precision,
  fee double precision,
  type "varchar"(10),
  price double precision,
  price2 double precision,
  CONSTRAINT deals_pkey PRIMARY KEY (id),
  CONSTRAINT deals_instr_id_acc_id_key UNIQUE (instr_id, acc_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.deals
  OWNER TO postgres;  
  
--DROP TABLE public.instr;
CREATE TABLE public.instr
(
  id integer NOT NULL,
  calc_date date,
  isin "varchar"(12),
  price double precision,
  CONSTRAINT instr_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.instr
  OWNER TO postgres;  
  
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
  CONSTRAINT saldo_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.saldo
  OWNER TO postgres;  
  
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
  
--DROP TABLE public.futdeals;
CREATE TABLE public.futdeals
(id_deal numeric(10),
isin char(25),
price numeric(16,5),
vol numeric(10),
kod_sell char(7),
kod_buy	char(7),
date char(10),
time char(8),
profit_usd numeric(20,4),
type numeric(2),
var_marg_b numeric(16,2),
var_marg_s numeric(16,2),
user_sell char(20),
user_buy char(20),
no_buy numeric(15),
no_sell	numeric(15),
fee_buy	numeric(16,2),
fee_sell numeric(16,2),
date2 Date,
comm_buy char(20),
comm_sell char(20),
du_buy	numeric(1),
du_sell	numeric(1),
fee_ns_b numeric(16, 2),
fee_ns_s numeric(16, 2),
price_rur numeric(16, 5),
ext_id_b numeric(11),
ext_id_s numeric(11),
date_clr date,
repo_id	numeric(11),
fee_ex_b numeric(16,2),
vat_ex_b numeric(16,2),
fee_cc_b numeric(16,2),
vat_cc_b numeric(16,2),
fee_ex_s numeric(16,2),
vat_ex_s numeric(16,2),
fee_cc_s numeric(16,2),
vat_cc_s numeric(16,2),
id_mult	numeric(10),
signs numeric(11)
)
