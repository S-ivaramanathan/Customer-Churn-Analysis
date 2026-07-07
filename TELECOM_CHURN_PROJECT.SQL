
USE telecom_churn;
SHOW TABLES;
SHOW DATABASES;
SELECT * FROM customer_churn LIMIT 10;
SELECT COUNT(*) AS total_customers
FROM customer_churn;
-- Total customers
SELECT COUNT(*) FROM customer_churn;
-- Customers who left
SELECT COUNT(*)
FROM customer_churn
WHERE Churn = 'Yes';
-- Churn percentage
SELECT
ROUND(
COUNT(CASE WHEN Churn='Yes' THEN 1 END)*100.0/COUNT(*),2
) AS Churn_Percentage
FROM customer_churn;
SELECT Gender,
       COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Gender;
SELECT Gender,
       COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY Gender;
SELECT Gender,
       COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Gender;
SELECT Gender,
       COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY Gender;
SELECT Contract,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Contract;
SELECT Contract,
       COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY Contract;
SELECT PaymentMethod,
       COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY PaymentMethod;
SELECT PaymentMethod,
COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn='Yes'
GROUP BY PaymentMethod;
SELECT InternetService,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY InternetService;
SELECT InternetService,
COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn='Yes'
GROUP BY InternetService ;
SELECT ROUND(AVG(MonthlyCharges),2)
AS Average_Monthly_Charges
FROM customer_churn;
SELECT MAX(MonthlyCharges) AS Highest_Monthly_Charge
FROM customer_churn;
SELECT MIN(MonthlyCharges) AS Lowest_Monthly_Charge
FROM customer_churn;
SELECT
ROUND(AVG(tenure),2) AS Average_Tenure
FROM customer_churn;
SELECT
MAX(tenure) AS Highest_Tenure
FROM customer_churn;
SELECT
MIN(tenure) AS Lowest_Tenure
FROM customer_churn;
SELECT SeniorCitizen,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY SeniorCitizen;
SELECT SeniorCitizen,
COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn='Yes'
GROUP BY SeniorCitizen;
SELECT Partner,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Partner;
SELECT Partner,
COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn='Yes'
GROUP BY Partner;
SELECT Dependents,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Dependents;
SELECT Dependents,
COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn='Yes'
GROUP BY Dependents;
SELECT customerID,
MonthlyCharges
FROM customer_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;
SELECT customerID,
tenure
FROM customer_churn
ORDER BY tenure DESC
LIMIT 10;
SELECT DISTINCT PaymentMethod
FROM customer_churn;
SELECT *
FROM customer_churn
WHERE MonthlyCharges BETWEEN 50 AND 100;
SELECT *
FROM customer_churn
WHERE Contract IN ('One year','Two year');
SELECT *
FROM customer_churn
WHERE customerID LIKE '5%';
SELECT Contract,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Contract
HAVING COUNT(*) > 1000;
SELECT customerID,
CASE
WHEN tenure < 12 THEN 'New Customer'
WHEN tenure BETWEEN 12 AND 36 THEN 'Regular Customer'
ELSE 'Loyal Customer'
END AS Customer_Type
FROM customer_churn;
SELECT *
FROM customer_churn
WHERE MonthlyCharges >
(
SELECT AVG(MonthlyCharges)
FROM customer_churn
);
SELECT customerID,
MonthlyCharges,
RANK() OVER(ORDER BY MonthlyCharges DESC) AS Rank_No
FROM customer_churn;
SELECT customerID,
tenure,
ROW_NUMBER() OVER(ORDER BY tenure DESC) AS Row_No
FROM customer_churn;
SELECT customerID,
MonthlyCharges,
DENSE_RANK() OVER(ORDER BY MonthlyCharges DESC) AS DenseRank
FROM customer_churn;
SELECT customerID,
       MonthlyCharges
FROM customer_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;
SELECT customerID,
       TotalCharges
FROM customer_churn
ORDER BY TotalCharges DESC
LIMIT 10;
SELECT *
FROM customer_churn
WHERE tenure >
(
    SELECT AVG(tenure)
    FROM customer_churn
);
SELECT *
FROM customer_churn
WHERE MonthlyCharges >
(
    SELECT AVG(MonthlyCharges)
    FROM customer_churn
);
SELECT customerID,
       MonthlyCharges,
       RANK() OVER(ORDER BY MonthlyCharges DESC) AS Rank_No
FROM customer_churn;
SELECT customerID,
       tenure,
       ROW_NUMBER() OVER(ORDER BY tenure DESC) AS Row_No
FROM customer_churn;
SELECT customerID,
       MonthlyCharges,
       DENSE_RANK() OVER(ORDER BY MonthlyCharges DESC) AS DenseRank
FROM customer_churn;
CREATE VIEW churn_customers AS
SELECT *
FROM customer_churn
WHERE Churn = 'Yes';
SELECT *
FROM churn_customers;
SELECT InternetService,
       COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY InternetService;
SELECT Contract,
       AVG(MonthlyCharges) AS Avg_MonthlyCharges
FROM customer_churn
GROUP BY Contract;
SELECT Contract,
       MAX(MonthlyCharges) AS Highest_MonthlyCharges
FROM customer_churn
GROUP BY Contract;
SELECT Contract,
       MIN(MonthlyCharges) AS Lowest_MonthlyCharges
FROM customer_churn
GROUP BY Contract;
SELECT PaymentMethod,
       AVG(tenure) AS Avg_Tenure
FROM customer_churn
GROUP BY PaymentMethod;
SELECT PaymentMethod,
       COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY PaymentMethod;
WITH HighCharges AS (
    SELECT customerID, MonthlyCharges
    FROM customer_churn
    WHERE MonthlyCharges > 80
)
SELECT *
FROM HighCharges;
CREATE VIEW Active_Customers AS
SELECT customerID, tenure, MonthlyCharges
FROM customer_churn
WHERE Churn='No';
DROP VIEW Active_Customers;
CREATE VIEW Active_Customers AS
SELECT customerID,
       tenure,
       MonthlyCharges
FROM customer_churn
WHERE Churn = 'No';
ALTER TABLE customer_churn
ADD Customer_Status VARCHAR(20);


