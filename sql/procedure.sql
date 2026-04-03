CREATE PROCEDURE add_member(
    p_name VARCHAR,
    p_age INT,
    p_email VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO members(name, age, email)
    VALUES (p_name, p_age, p_email);
END;
$$;