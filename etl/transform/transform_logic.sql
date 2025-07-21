-- File: etl/transform/temp_cleaning.sql
-- Explanation: SQL to clean up temperature logs for analysis.
SELECT * FROM temp_ramp_logs WHERE surface_temp IS NOT NULL;
