-- Create log table
CREATE TABLE IF NOT EXISTS members_log (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    action VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create function
CREATE OR REPLACE FUNCTION log_member_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO members_log(name, action)
    VALUES (NEW.name, 'INSERT');
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Drop old trigger (if exists)
DROP TRIGGER IF EXISTS trg_member_insert ON members;

-- Create trigger
CREATE TRIGGER trg_member_insert
AFTER INSERT ON members
FOR EACH ROW
EXECUTE FUNCTION log_member_insert();