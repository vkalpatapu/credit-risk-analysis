-- ============================================
-- PROJECT 2: Credit Risk Analysis
-- Dataset: Kaggle Credit Risk Dataset (32,581 rows)
-- Tools: PostgreSQL
-- Author: Venkat Anirudh Kalpatapu
-- ============================================

-- Query 1: Overall Default Rate
-- What is our overall loan default rate?
SELECT 
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) AS default_rate_pct
FROM credit_risk;

-- Result: 32,581 loans | 7,108 defaults | 21.82% default rate


-- Query 2: Default Rate by Loan Grade
-- Which grades are highest risk?
SELECT 
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) AS default_rate_pct
FROM credit_risk
GROUP BY loan_grade
ORDER BY default_rate_pct DESC;

-- Key Finding: Risk cliff between Grade C (20%) and Grade D (59%)!
-- Grade G = 98.44% default rate


-- Query 3: Default Rate by Loan Purpose
-- Which loan purpose is riskiest?
SELECT 
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) AS default_rate_pct,
    CASE 
        WHEN ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) > 30 THEN 'High Risk'
        WHEN ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) > 15 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_label
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate_pct DESC;

-- Key Finding: Debt Consolidation 28.59% riskiest | Venture 14.81% safest


-- Query 4: Default Rate by Income Bracket
-- Does income predict default?
SELECT 
    CASE 
        WHEN person_income < 30000 THEN 'Low Income'
        WHEN person_income < 60000 THEN 'Middle Income'
        WHEN person_income < 100000 THEN 'Upper Middle'
        ELSE 'High Income'
    END AS income_bracket,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) AS default_rate_pct
FROM credit_risk
GROUP BY income_bracket
ORDER BY default_rate_pct DESC;

-- Key Finding: Low Income 47.07% vs High Income 8.93% default rate
-- Income is the strongest single predictor of repayment


-- Query 5: Prior Default History Impact
-- Does past default predict future default?
SELECT 
    cb_person_default_on_file AS default_history,
    ROUND(SUM(loan_status)::NUMERIC / COUNT(*) * 100, 2) AS default_rate_pct
FROM credit_risk
GROUP BY default_history
ORDER BY default_rate_pct DESC;

-- Key Finding: Prior defaulters (37.81%) are 2x more likely to default vs clean history (18.39%)
