create or REPLACE function merge_fields(parm1 integer) returns text
LANGUAGE plpgsql
AS $$
DECLARE
    parm2 INTEGER;
BEGIN
    SELECT 1 into parm2 from current_timestamp;
    RETURN parm1 + parm2;
END;
$$;
