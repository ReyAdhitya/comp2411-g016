-- Test ID: N04 | Rule: Unique session type name | Prerequisite: type_id = 1 exists | Expected Error: 1062 (Duplicate entry)
INSERT INTO SessionType (type_name)
SELECT type_name
FROM SessionType
WHERE type_id = 1;
