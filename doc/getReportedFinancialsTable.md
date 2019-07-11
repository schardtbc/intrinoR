### `getReportedFinancialsTable`
***
***

### Description

 Returns the As-Reported Financials directly from the financial
 statements of the XBRL filings from the company specified by the `id` param.

### Usage
```r
getReportedFinancialsTable(id)
```

### Arguments
Argument      |Description
------------- |----------------
```id```     |     String The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period) for the Fundamental
### Value

 reported_financials tibble formated as wide table with one column per metric tag

### Seealso

 Other fundamental endpoints: [`getFundamentalById`](getFundamentalById.md) ,
  [`getReportedFinancials`](getReportedFinancials.md) ,
  [`getStandardizedFinancialsTable`](getStandardizedFinancialsTable.md) ,
  [`getStandardizedFinancials`](getStandardizedFinancials.md) ,
  [`lookupFundamental`](lookupFundamental.md) 

