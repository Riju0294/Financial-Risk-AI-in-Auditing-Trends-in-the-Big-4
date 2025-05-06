create database big4;

use big4;

select *
from f_risk;

drop table big4_financial_risk_compliance;

/* 1. Audit Risk Analysis

Which audit firm has handled the highest number of high-risk cases in the last 5 years? */

SELECT Firm_Name, SUM(High_Risk_Cases) AS Total_High_Risk
FROM f_risk
WHERE Year >= YEAR(CURRENT_DATE) - 5
GROUP BY Firm_Name
ORDER BY Total_High_Risk DESC
LIMIT 1;

/* 2. Compliance Violations Trend

How have compliance violations changed over time for each firm? */

SELECT Year, Firm_Name, SUM(Compliance_Violations) AS Total_Violations
FROM f_risk
GROUP BY Year, Firm_Name
ORDER BY Year ASC;

/* 3. Fraud Detection Efficiency

Which firm has detected the most fraud cases relative to its total audit engagements? */

SELECT Firm_Name, 
       SUM(Fraud_Cases_Detected) AS Total_Fraud_Cases,
       SUM(Total_Audit_Engagements) AS Total_Audits,
       (SUM(Fraud_Cases_Detected) * 100.0 / SUM(Total_Audit_Engagements)) AS Fraud_Detection_Rate
FROM f_risk
GROUP BY Firm_Name
ORDER BY Fraud_Detection_Rate DESC;

/* 4. Industry-Specific Risks

Which industry is most affected by high-risk cases? */

SELECT Industry_Affected, SUM(High_Risk_Cases) AS Total_High_Risk
FROM f_risk
GROUP BY Industry_Affected
ORDER BY Total_High_Risk DESC
LIMIT 1;

/* 5. Impact of AI in Auditing

How does the use of AI in auditing correlate with audit effectiveness? */

SELECT AI_Used_for_Auditing, 
       round(AVG(Audit_Effectiveness_Score),2) AS Avg_Audit_Effectiveness
FROM f_risk
GROUP BY AI_Used_for_Auditing;

/* 6. Revenue Impact of High-Risk Cases

What is the total revenue impact of high-risk cases across firms? */

SELECT Firm_Name, sum(High_Risk_Cases) AS Total_High_Risk_Cases, round(SUM(Total_Revenue_Impact),2) AS Total_Revenue_Impact
FROM f_risk
GROUP BY Firm_Name
ORDER BY Total_Revenue_Impact DESC;

/* 7. Workload vs. Satisfaction

Is there a correlation between employee workload and client satisfaction? */

SELECT Firm_Name, Employee_Workload, round(AVG(Client_Satisfaction_Score),2) AS Avg_Client_Satisfaction
FROM f_risk
GROUP BY Firm_Name, Employee_Workload
ORDER BY Employee_Workload ASC;

/* 8. Top Performing Audit Firm

Which firm has the highest audit effectiveness score on average? */

SELECT Firm_Name, round(AVG(Audit_Effectiveness_Score),2) AS Avg_Audit_Effectiveness
FROM f_risk
GROUP BY Firm_Name
ORDER BY Avg_Audit_Effectiveness DESC
LIMIT 1;

/* 9. Fraud Cases by Industry

Top 3 industries have the highest number of fraud cases detected? */

SELECT Industry_Affected, SUM(Fraud_Cases_Detected) AS Total_Fraud_Cases
FROM f_risk
GROUP BY Industry_Affected
ORDER BY Total_Fraud_Cases DESC
LIMIT 3;

/* 10. Yearly Trend of High-Risk Cases

How has the number of high-risk cases changed over the years? */

SELECT Year,Firm_Name, SUM(High_Risk_Cases) AS Total_High_Risk
FROM f_risk
GROUP BY Year, Firm_Name
ORDER BY Year ASC;

/* 11. Most Client-Satisfied Audit Firm

Which audit firm has the highest client satisfaction score on average? */

SELECT Firm_Name, 
       round(AVG(Client_Satisfaction_Score),2) AS Avg_Client_Satisfaction
FROM f_risk
GROUP BY Firm_Name
ORDER BY Avg_Client_Satisfaction DESC
LIMIT 1;

/* 12. Firms with Most High-Risk Cases but Good Client Satisfaction

Which firms handle the most high-risk cases but still have high client satisfaction? */

SELECT Firm_Name, 
       SUM(High_Risk_Cases) AS Total_High_Risk,
       round(AVG(Client_Satisfaction_Score),2) AS Avg_Client_Satisfaction
FROM f_risk
GROUP BY Firm_Name
ORDER BY Total_High_Risk DESC
LIMIT 5;