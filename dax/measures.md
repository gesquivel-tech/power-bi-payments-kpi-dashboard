# DAX Measures

Suggested DAX measures for the Power BI Payments KPI Dashboard.

These measures are designed to respond correctly to filters, slicers, and visual interactions.

## Core measures

```DAX
Total Payments =
COUNTROWS(Payments)
```

```DAX
Successful Payments =
COALESCE(
    CALCULATE(
        [Total Payments],
        KEEPFILTERS(Payments[Status] = "Successful")
    ),
    0
)
```

```DAX
Failed Payments =
COALESCE(
    CALCULATE(
        [Total Payments],
        KEEPFILTERS(Payments[Status] = "Failed")
    ),
    0
)
```

```DAX
Pending Payments =
COALESCE(
    CALCULATE(
        [Total Payments],
        KEEPFILTERS(Payments[Status] = "Pending")
    ),
    0
)
```

```DAX
Refunded Payments =
COALESCE(
    CALCULATE(
        [Total Payments],
        KEEPFILTERS(Payments[Status] = "Refunded")
    ),
    0
)
```

```DAX
Failure Rate =
DIVIDE(
    [Failed Payments],
    [Total Payments],
    0
)
```

```DAX
Success Rate =
DIVIDE(
    [Successful Payments],
    [Total Payments],
    0
)
```

## Amount measures

```DAX
Total Amount =
SUM(Payments[Amount])
```

```DAX
Successful Amount =
COALESCE(
    CALCULATE(
        [Total Amount],
        KEEPFILTERS(Payments[Status] = "Successful")
    ),
    0
)
```

```DAX
Failed Amount =
COALESCE(
    CALCULATE(
        [Total Amount],
        KEEPFILTERS(Payments[Status] = "Failed")
    ),
    0
)
```

```DAX
Average Payment Amount =
COALESCE(
    AVERAGE(Payments[Amount]),
    0
)
```

## Error and SLA measures

```DAX
Payments With Error =
COALESCE(
    CALCULATE(
        [Total Payments],
        KEEPFILTERS(NOT ISBLANK(Payments[ErrorType])),
        KEEPFILTERS(Payments[ErrorType] <> "None")
    ),
    0
)
```

```DAX
Error Rate =
DIVIDE(
    [Payments With Error],
    [Total Payments],
    0
)
```

```DAX
SLA Breaches =
COALESCE(
    CALCULATE(
        [Total Payments],
        KEEPFILTERS(Payments[SLAStatus] = "Breached SLA")
    ),
    0
)
```

```DAX
SLA Breach Rate =
DIVIDE(
    [SLA Breaches],
    [Total Payments],
    0
)
```

## Optional calendar table

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

Measures are preferred for dynamic reporting because they respond to filters and slicers.

`DIVIDE()` is used instead of `/` to safely handle division by zero.

`KEEPFILTERS()` is used in status-specific measures so that visual interactions behave correctly. For example:

* selecting `Failed` should show a `Failure Rate` of 100%.
* selecting `Successful`, `Pending`, or `Refunded` should show `Failed Payments = 0`.
* selecting a region, product, or channel should recalculate the KPIs only within that selected context.

These measures should be validated against the source dataset or SQL queries before being used for business reporting.
