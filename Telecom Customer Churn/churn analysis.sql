use churn;
-- Question 1
-- Count the total number of records in the dataset?
SELECT count(*) AS TotalRecords FROM churn;

-- Question 2
-- Find the number of unique customers in the dataset?
SELECT count( DISTINCT customerID) AS UniqueCustomers FROM churn;

-- Question 3
-- Calculate the average tenure of customers?
SELECT AVG(tenure) AS AverageTenure FROM churn;

-- Question 4
-- Retrieve the customers who have churned?
SELECT  * FROM churn WHERE Churn = 'Yes';

-- Question 5
-- Find the percentage of customers who have churned?
SELECT (COUNT(CASE WHEN Churn ='Yes' THEN 1 END) / count(*)) *100
AS ChurnPercentage FROM churn;

-- Question 6
-- Identify the customers with the longest tenure?
SELECT * FROM churn order by tenure DESC limit 1;

-- Question 7
-- Count the number of customers with a Senior Citizen status?
SELECT COUNT(*) AS SeniorCitizenCount FROM churn WHERE SeniorCitizen = 1;

-- Question 8
-- Find the average monthly charges for customers with and without churn?
SELECT Churn, AVG(MonthlyCharges) AS AvgMonthlyCharges FROM churn group by Churn;

-- Qestion 9 
-- List the unique values in the Contract column?
select distinct Contract from churn;

-- Question 10
-- Calculate the total charges for all customers?
SELECT SUM(TotalCharges) as TotalCharges from churn;

-- Question 11
-- Retrieve the customers who have both OnlineSecurity and OnlineBackup?
select * from churn
where OnlineSecurity = 'Yes' and
OnlineBackup = 'Yes';

-- Question 12
-- Find the average tenure for customers who have churned?
select avg(tenure) as AvgTenureChurned from churn 
where Churn = 'Yes';

-- Question 13
-- List the unique values in the PaymentMethod column?
select distinct PaymentMethod from churn;

-- Question 14
-- Calculate the total number of customers for each InternetService type?
select InternetService, count(*) as CustomerCount from churn 
group by InternetService;

-- Question 15
-- Find the customers with the highest MonthlyCharges?
select * from churn order by MonthlyCharges desc Limit 1;

-- Question 16
-- Count the number of customers with paperless billing?
select count(*) as PaperlessBillingCount from churn where PaperlessBilling = 'Yes';

-- Question 17
-- Calculate the average tenure for each gender?
select Gender, avg(tenure) as AvgTenure from churn 
group by Gender;

-- Question 18
-- Retrieve the customers with a tenure greater than 50 months and a MonthlyCharges less than 70?
select * from churn where tenure >50
and MonthlyCharges <70;

-- Question 19
-- Find the customers with the highest total charges?
select * from churn order by TotalCharges desc limit 1;

-- Question 20
-- Count the number of customers who have both StreamingTV and StreamingMovies?
select count(*) as StreamingCustomers from churn 
where StreamingTV ='Yes' and 
StreamingMovies = 'Yes';

-- Question 21
-- Calculate the average tenure for customers who have not churned and have a MonthlyCharges greater than 50?
select AVG(tenure) as AvgTenure FROM churn 
WHERE Churn = 'No' and
MonthlyCharges > 50;

-- Question 22
-- Identify the top 5 contracts with the highest average MonthlyCharges?
select contract, AVG(MonthlyCharges) as AvgMonthlyCharges from churn
group by Contract order by AvgMonthlyCharges desc limit 5;

-- Question 23
-- Find the percentage of Senior Citizens among customers who have churned?
SELECT (COUNT(CASE WHEN Churn = 'Yes' AND SeniorCitizen = 1 THEN 1 END) /
 COUNT(CASE WHEN Churn = 'Yes' THEN 1 END)) * 100 
 AS SeniorCitizenPercentage FROM churn WHERE Churn = 'Yes';

-- Question 24
-- Retrieve the top 10 customers with the highest TotalCharges?
select * from churn order by TotalCharges desc limit 10;

-- Question 25
-- Calculate the total charges for each contract type?
select Contract, sum(TotalCharges) as TotalCharges from churn 
group by Contract;

-- Question 26
-- Identify the most common InternetService type among customers who have churned?
select InternetService, count(*) as Count from churn 
where Churn = 'Yes' group by InternetService 
order by Count desc limit 1;

-- Question 27
-- Calculate the average MonthlyCharges for customers with and without OnlineSecurity, grouped by Contract type?
SELECT Contract, OnlineSecurity, AVG(MonthlyCharges) AS AvgMonthlyCharges FROM churn GROUP BY Contract, OnlineSecurity;


-- Question 28
-- List the top 5 PaymentMethods with the highest average MonthlyCharges?
SELECT PaymentMethod, AVG(MonthlyCharges) AS AvgMonthlyCharges FROM churn
GROUP BY PaymentMethod ORDER BY AvgMonthlyCharges DESC LIMIT 5;

-- Question 29
-- Count the number of customers for each combination of OnlineSecurity and OnlineBackup?
SELECT OnlineSecurity, OnlineBackup, COUNT(*) AS CustomerCount FROM churn
GROUP BY OnlineSecurity, OnlineBackup;

-- Question 31
-- Calculate the average MonthlyCharges for customers with different combinations of StreamingTV and StreamingMovies?
SELECT StreamingTV, StreamingMovies, AVG(MonthlyCharges) AS AvgMonthlyCharges 
FROM churn GROUP BY StreamingTV, StreamingMovies;

-- Question 32
-- Find the customers who have churned and have a tenure less than the average tenure for all customers?
SELECT * FROM churn WHERE Churn = 'Yes' AND tenure < (SELECT AVG(tenure) 
FROM churn);

-- Question 33
-- Identify the customers who have a MonthlyCharges greater than the average MonthlyCharges for their respective Contract type?
SELECT * FROM churn WHERE MonthlyCharges > (SELECT AVG(MonthlyCharges) 
FROM churn WHERE Contract = churn.Contract);

-- Question 34
-- Calculate the percentage of customers with MultipleLines among those who have churned?
SELECT (COUNT(CASE WHEN Churn = 'Yes' AND MultipleLines = 'Yes' THEN 1 END) / 
COUNT(CASE WHEN Churn = 'Yes' THEN 1 END)) * 100 AS MultipleLinesPercentage FROM churn WHERE Churn = 'Yes';

-- Question 35
-- List the top 5 Contract types with the highest number of customers?
SELECT Contract, COUNT(*) AS CustomerCount FROM churn 
GROUP BY Contract ORDER BY CustomerCount DESC LIMIT 5;

-- Question 36
-- Calculate the average tenure for customers who have churned, grouped by Contract type?
SELECT Contract, AVG(tenure) AS AvgTenure FROM churn WHERE Churn = 'Yes' GROUP BY Contract;

-- Question 37
-- Retrieve the customers who have churned and have a MonthlyCharges less than the average MonthlyCharges for all customers?
SELECT * FROM churn WHERE Churn = 'Yes' AND MonthlyCharges < 
(SELECT AVG(MonthlyCharges) FROM churn);

-- Question 38
-- Calculate the average tenure for customers with and without OnlineSecurity, grouped by PaymentMethod?
SELECT PaymentMethod, OnlineSecurity, AVG(tenure) AS AvgTenure
FROM churn GROUP BY PaymentMethod, OnlineSecurity;

-- Question 39
-- Calculate the cumulative sum of TotalCharges over time for each customer?
SELECT customerID, TotalCharges, SUM(TotalCharges) OVER 
(PARTITION BY customerID ORDER BY tenure) AS CumulativeTotalCharges FROM churn;

-- Question 40
-- Calculate the moving average of MonthlyCharges over a window of 3 months for each customer?
SELECT customerID, MonthlyCharges, AVG(MonthlyCharges) OVER 
(PARTITION BY customerID ORDER BY tenure ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) 
AS MovingAvgMonthlyCharges FROM churn;

-- Question 41
-- Find the customers whose MonthlyCharges have increased compared to the previous month?
SELECT customerID, MonthlyCharges
FROM (
    SELECT customerID, MonthlyCharges, LAG(MonthlyCharges) OVER (PARTITION BY customerID ORDER BY tenure) AS PrevMonthlyCharges
    FROM churn
) AS t
WHERE MonthlyCharges > PrevMonthlyCharges;

-- Question 42
-- Calculate the average MonthlyCharges for customers who have churned, considering only the months leading up to their churn?
SELECT customerID, AVG(MonthlyCharges) AS AvgMonthlyChargesBeforeChurn
FROM (
    SELECT customerID, MonthlyCharges, ROW_NUMBER() OVER (PARTITION BY customerID ORDER BY tenure DESC) AS rn
    FROM churn WHERE Churn = 'Yes'
) AS t
WHERE rn <= 3 -- Consider the last 3 months before churn
GROUP BY customerID;
