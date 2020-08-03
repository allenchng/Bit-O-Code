-- simple filter
-- add % to beginning of string to catch cases like acne diabetes

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE "%DIAB1%"