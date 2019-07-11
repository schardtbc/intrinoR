### `lookupFundamental`
***
***

### Description

 Returns the fundamental financial data for the Company with the given `identifier` and with the given parameters

### Usage
```r
lookupFundamental(identifier, statement_code, fiscal_year, fiscal_period)
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Company identifier (Ticker, CIK, LEI, Intrinio ID)
```statement_code```     |     String income_statment | balance_sheet_statement | cash_flow_statement | calculations The statement code
```fiscal_year```     |     Number fiscalYear The fiscal year
```fiscal_period```     |     String Q1TTM | Q2TTM | Q3TTM | FY | Q1 | Q2 | Q3 | Q4 | Q2YTD | Q3YTD The fiscal period
### Seealso

 Other fundamental endpoints: [`getFundamentalById`](getFundamentalById.md) ,
  [`getReportedFinancialsTable`](getReportedFinancialsTable.md) ,
  [`getReportedFinancials`](getReportedFinancials.md) ,
  [`getStandardizedFinancialsTable`](getStandardizedFinancialsTable.md) ,
  [`getStandardizedFinancials`](getStandardizedFinancials.md) 

