# Data Dictionary

## Payments table

| Field | Type | Description |
|---|---|---|
| PaymentID | Text | Unique synthetic payment identifier. |
| PaymentDate | Date | Date when the payment was processed. |
| CustomerType | Text | Customer segment: Individual, Small Business, or Enterprise. |
| Product | Text | Protection/service product associated with the payment. |
| Channel | Text | Source channel where the payment was processed. |
| Status | Text | Payment status: Successful, Failed, Pending, or Refunded. |
| Amount | Decimal | Payment amount. Refunds are represented as negative values. |
| ErrorType | Text | Error category for non-successful transactions. Successful payments use `None`. |
| Region | Text | Synthetic geographic region. |
| SLAStatus | Text | Indicates whether the payment handling stayed within SLA or breached SLA. |

## Important assumptions

- This dataset is synthetic and created for portfolio/interview practice only.
- Failure Rate = Failed Payments / Total Payments.
- SLA Breach Rate = SLA Breaches / Total Payments.
- Total Amount includes refunds as negative values.
