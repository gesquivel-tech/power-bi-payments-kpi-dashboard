# Power BI Payments KPI Dashboard

Small Power BI project focused on data modeling, DAX measures, KPI reporting, data validation, and business-friendly dashboard design.

This project uses synthetic payment data to simulate a reporting scenario similar to what a Business Intelligence, Reporting, or Business Unit Systems Analyst could face in a corporate environment.

## Objective

Build a simple Power BI dashboard that helps technical and non-technical users understand payment performance, failed transactions, processed amount, SLA status, and error trends.

## Tools

- Power BI Desktop
- DAX
- Data modeling
- SQL validation logic
- Synthetic CSV data

## Dataset

The dataset is fully synthetic and does not contain real customer, company, or payment information.

Main table:

- `Payments`

Main fields:

- `PaymentID`
- `PaymentDate`
- `CustomerType`
- `Product`
- `Channel`
- `Status`
- `Amount`
- `ErrorType`
- `Region`
- `SLAStatus`

## Suggested Power BI model

Start with one fact table:

- `Payments`

Then create a calculated calendar table in DAX:

```DAX
Calendar =
CALENDAR(
    MIN(Payments[PaymentDate]),
    MAX(Payments[PaymentDate])
)
```

Create a relationship:

- `Calendar[Date]` -> `Payments[PaymentDate]`

## Key KPIs

- Total Payments
- Successful Payments
- Failed Payments
- Failure Rate
- Total Amount
- Average Payment Amount
- SLA Breach Rate
- Total Errors
- Errors by Type
- Payments by Channel
- Monthly Payment Trend

## Suggested dashboard pages

### 1. Executive Overview

Cards:

- Total Payments
- Successful Payments
- Failed Payments
- Failure Rate
- Total Amount
- SLA Breach Rate

Charts:

- Payments by month
- Failure rate by channel
- Amount by product
- Errors by type

Slicers:

- Date
- Region
- Product
- Channel
- Status

### 2. Data Quality / Operations View

Cards:

- Pending Payments
- Refunded Payments
- Payments with Error
- SLA Breaches

Charts:

- Error type distribution
- SLA status by channel
- Failed payments by region
- Monthly trend of failed payments

## Interview pitch

This project demonstrates how I would transform raw operational/payment data into reliable business indicators. It includes data modeling, DAX measures, KPI design, validation logic, and a dashboard structure intended for both technical and non-technical stakeholders.

## Repository structure

```text
power-bi-payments-kpi-dashboard/
│
├── README.md
├── data/
│   └── sample_payments.csv
├── dax/
│   └── measures.md
├── sql/
│   └── validation_queries.sql
├── docs/
│   ├── data_dictionary.md
│   └── interview_pitch.md
├── screenshots/
│   └── add dashboard screenshots here
└── powerbi/
    └── add .pbix file here
```
