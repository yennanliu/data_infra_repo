-- SELECT 'RUN ANALYSIS SQL ON BUILT TABLES..'; 

-- # SQL 1 
-- SELECT
-- Client_Id,
-- COUNT(*) AS ORDER_PER_USER 
-- FROM 
-- Trips
-- GROUP BY 1 ORDER BY 1; 

-- # SQL 2 
-- SELECT t.* FROM 
-- Trips t
-- JOIN Users u  
-- ON 
-- t.Client_Id = u.Users_Id
-- WHERE u.Banned = 'No'
