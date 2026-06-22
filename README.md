# Credit Risk Analysis — Financial Analytics

## Business Problem
As a financial analyst at ABC Bank, analyze 32,581 loan records to identify default patterns and provide data-driven recommendations to help the bank make safer lending decisions.

## Dataset
- **Source:** Kaggle — Credit Risk Dataset
- **Size:** 32,581 rows | 12 columns
- **Key Variable:** loan_status (0 = Paid, 1 = Default)

## Tools Used
- **Excel** — COUNTA, COUNTIF, VLOOKUP, Pivot Tables
- **PostgreSQL** — 5 business queries with CASE WHEN
- **Power BI** — DAX DIVIDE measure, dynamic slicers
- **Python** — Pandas fillna, value_counts, groupby

## Key Findings
- Overall default rate: 21.82% — 1 in 5 loans default
- Critical risk cliff: Grade C defaults at 20% vs Grade D at 59% (nearly triples)
- Grade G = 98.44% default rate
- Low income borrowers default at 47% vs High income at 8.93%
- Prior defaulters are 2x more likely to default again (37.81% vs 18.39%)
- Debt consolidation loans are riskiest purpose at 28.59% default rate

## Business Recommendations
- Cap standard lending at Grade C — Grade D and above needs significantly higher interest rates
- Implement mandatory income verification for all loan applications
- Automatic flag and manual review for any applicant with prior default history
- Add income verification requirements specifically for debt consolidation applications

## Files
- `credit_risk_queries.sql` — 5 PostgreSQL queries with CASE WHEN analysis
- `credit_risk_analysis.ipynb` — Python EDA notebook
- `credit_risk_dashboard.png` — Power BI dashboard screenshot

## Skills Demonstrated
SQL (CASE WHEN, ::NUMERIC casting, multiple aggregations), Excel (VLOOKUP, COUNTIF, Pivot Average), Power BI (DAX DIVIDE measure, KPI Cards, Slicer), Python (fillna, value_counts, groupby mean on binary column)
