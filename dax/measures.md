# DAX Measures

Suggested DAX measures for the Power BI Payments KPI Dashboard.

## Core measures

```DAX
Total Payments =
COUNTROWS(Payments)
```

```DAX
Successful Payments =
CALCULATE(
    [Total Payments],
    Payments[Status] = "Successful"
)
```

```DAX
Failed Payments =
CALCULATE(
    [Total Payments],
    Payments[Status] = "Failed"
)
```

```DAX
Pending Payments =
CALCULATE(
    [Total Payments],
    Payments[Status] = "Pending"
)
```

```DAX
Refunded Payments =
CALCULATE(
    [Total Payments],
    Payments[Status] = "Refunded"
)
```

```DAX
Failure Rate =
DIVIDE(
    [Failed Payments],
    [Total Payments]
)
```

```DAX
Success Rate =
DIVIDE(
    [Successful Payments],
    [Total Payments]
)
```

## Amount measures

```DAX
Total Amount =
SUM(Payments[Amount])
```

```DAX
Successful Amount =
CALCULATE(
    [Total Amount],
    Payments[Status] = "Successful"
)
```

```DAX
Average Payment Amount =
AVERAGE(Payments[Amount])
```

## Error and SLA measures

```DAX
Payments With Error =
CALCULATE(
    [Total Payments],
    Payments[ErrorType] <> "None"
)
```

```DAX
Error Rate =
DIVIDE(
    [Payments With Error],
    [Total Payments]
)
```

```DAX
SLA Breaches =
CALCULATE(
    [Total Payments],
    Payments[SLAStatus] = "Breached SLA"
)
```

```DAX
SLA Breach Rate =
DIVIDE(
    [SLA Breaches],
    [Total Payments]
)
```

## Calendar table

```DAX
Calendar =
CALENDAR(
    MIN(Payments[PaymentDate]),
    MAX(Payments[PaymentDate])
)
```

## Optional calculated columns

```DAX
Payment Month =
FORMAT(Payments[PaymentDate], "YYYY-MM")
```

```DAX
Is Failed =
IF(Payments[Status] = "Failed", 1, 0)
```

## Notes

- Measures are preferred for dynamic reporting because they respond to filters and slicers.
- `DIVIDE()` is used instead of `/` to safely handle division by zero.
- These measures should be validated against the source dataset or SQL queries before being used for business reporting.
