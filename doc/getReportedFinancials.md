### `getReportedFinancials`
***
***

### Description

 Returns the As-Reported Financials directly from the financial
 statements of the XBRL filings from the company specified by the `id` param.

### Usage
```r
getReportedFinancials(id)
```

### Arguments
Argument      |Description
------------- |----------------
```id```     |     String The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period) for the Fundamental
### Value

 reported_financials tibble formated as deep table with one row per metric tag

### Seealso

 Other fundamental endpoints: [`getFundamentalById`](getFundamentalById.md) ,
  [`getReportedFinancialsTable`](getReportedFinancialsTable.md) ,
  [`getStandardizedFinancialsTable`](getStandardizedFinancialsTable.md) ,
  [`getStandardizedFinancials`](getStandardizedFinancials.md) ,
  [`lookupFundamental`](lookupFundamental.md) 

