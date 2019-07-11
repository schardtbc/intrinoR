### `getStandardizedFinancials`
***
***

### Description

 Returns professional-grade historical financial data.
 This data is standardized, cleansed and verified to ensure the highest quality
 data sourced directly from the XBRL financial statements. The primary purpose
 of standardized financials are to facilitate comparability across a single
 company’s fundamentals and across all companies' fundamentals.

### Usage
```r
getStandardizedFinancials(id)
```

### Arguments
Argument      |Description
------------- |----------------
```id```     |     String The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period) for the Fundamental
### Value

 standardized_financials tibble formated as deep table with one row per metric tag

### Seealso

 Other fundamental endpoints: [`getFundamentalById`](getFundamentalById.md) ,
  [`getReportedFinancialsTable`](getReportedFinancialsTable.md) ,
  [`getReportedFinancials`](getReportedFinancials.md) ,
  [`getStandardizedFinancialsTable`](getStandardizedFinancialsTable.md) ,
  [`lookupFundamental`](lookupFundamental.md) 

