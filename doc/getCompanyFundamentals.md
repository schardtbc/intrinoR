# `getCompanyFundamentals`

 Returns all Fundamentals for the Company with the given `identifier`. Returns Fundamentals matching parameters when supplied.

## Description


 All Fundamentals by Company
 Returns all Fundamentals for the Company with the given `identifier`. Returns Fundamentals matching parameters when supplied.


## Usage

```r
getCompanyFundamentals(identifier, opts = list())
```


## Arguments

Argument      |Description
------------- |----------------
```identifier```     |     String A Company identifier (Ticker, CIK, LEI, Intrinio ID)
```opts```     |     named list Optional parameters
```opts.filed_after```     |     String Date YYYY-MM-DD Filed on or after this date
```opts.filed_before```     |     String Date YYYY-MM-DD Filed on or before this date
```opts.reported_only```     |     Boolean Only as-reported fundamentals
```opts.fiscal_year```     |     Number Only for the given fiscal year
```opts.statement_code```     |     String Only of the given statement code
```opts.type```     |     String Only of the given type
```opts.start_date```     |     String Date YYYY-MM-DD Only on or after the given date
```opts.end_date```     |     String Date YYYY-MM-DD Only on or before the given date
```opts.page_size```     |     Number opts.pageSize The number of results to return (default to 100)


###  Other company endpoints:

  [`getCompany`](getCompany.md) ,
  [`getCompanyDataPointHistory`](getCompanyDataPointHistory.md) ,
  [`getCompanyDataPointNumber`](getCompanyDataPointNumber.md) ,
  [`getCompanyDataPointText`](getCompanyDataPointText.md) ,
  [`getCompanyFundamentals`](getCompanyFundamentals.md) ,
  [`getCompanyFilings`](getCompanyFilings.md) ,
  [`getCompanyIPOs`](getCompanyIPOs.md) ,
  [`getCompanyNews`](getCompanyNews.md) ,
  [`getCompanySecurities`](getCompanySecurities.md) 


