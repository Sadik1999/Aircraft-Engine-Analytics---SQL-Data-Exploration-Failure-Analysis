-- Database Creation and Selection
CREATE DATABASE aircraft_engine_data;
USE aircraft_engine_data;

-- Basic Data Exploration
SELECT * FROM aircraft_engine_data LIMIT 20;
DESCRIBE aircraft_engine_data;
SELECT COUNT(*) FROM aircraft_engine_data;

-- Statistical Analysis of Key Parameters
SELECT 
    MIN(Engine_Temperature) AS Min_Temp,
    MAX(Engine_Temperature) AS Max_Temp,
    AVG(Engine_Temperature) AS Avg_Temp,
    MIN(Vibration_Levels) AS Min_Vibration,
    MAX(Vibration_Levels) AS Max_Vibration,
    AVG(Vibration_Levels) AS Avg_Vibration,
    MIN(Fuel_Consumption) AS Min_Fuel,
    MAX(Fuel_Consumption) AS Max_Fuel,
    AVG(Fuel_Consumption) AS Avg_Fuel
FROM aircraft_engine_data;

-- Checking for Missing Values
SELECT 
    SUM(CASE WHEN Engine_Temperature IS NULL THEN 1 ELSE 0 END) AS Missing_Temp,
    SUM(CASE WHEN Vibration_Levels IS NULL THEN 1 ELSE 0 END) AS Missing_Vibration,
    SUM(CASE WHEN Fuel_Consumption IS NULL THEN 1 ELSE 0 END) AS Missing_Fuel,
    SUM(CASE WHEN Engine_RPM IS NULL THEN 1 ELSE 0 END) AS Missing_RPM
FROM aircraft_engine_data;

-- Identifying Potential Anomalies
SELECT * FROM aircraft_engine_data 
WHERE Engine_Temperature < 750 OR Engine_Temperature > 950;

SELECT * FROM aircraft_engine_data
WHERE Vibration_Levels > 0.8;

-- Failure Analysis
SELECT Failure_Report, COUNT(*) AS Failure_Count
FROM aircraft_engine_data
WHERE Failure_Report <> 'No Failure'
GROUP BY Failure_Report
ORDER BY Failure_Count DESC;

SELECT Flight_Phase, COUNT(*) AS Failure_Count
FROM aircraft_engine_data
WHERE Failure_Report <> 'No Failure'
GROUP BY Flight_Phase
ORDER BY Failure_Count DESC;

-- Relationship Between Flight Phase and Engine Temperature
SELECT Flight_Phase, AVG(Engine_Temperature) AS Avg_Temperature
FROM aircraft_engine_data
GROUP BY Flight_Phase
ORDER BY Avg_Temperature DESC;

-- Fuel Consumption and Failures
SELECT AVG(Fuel_Consumption) AS Avg_Fuel_When_Failed
FROM aircraft_engine_data
WHERE Failure_Report <> 'No Failure';

-- Engine RPM and Failures
SELECT Engine_RPM, COUNT(*) AS Failure_Count
FROM aircraft_engine_data
WHERE Failure_Report <> 'No Failure'
GROUP BY Engine_RPM
ORDER BY Failure_Count DESC;

-- High Vibration and Failures
SELECT * FROM aircraft_engine_data
WHERE Failure_Report <> 'No Failure' AND Vibration_Levels > 0.7
ORDER BY Vibration_Levels DESC;

-- Fuel Consumption by Flight Phase
SELECT Flight_Phase, AVG(Fuel_Consumption) AS Avg_Fuel
FROM aircraft_engine_data
GROUP BY Flight_Phase
ORDER BY Avg_Fuel DESC;






