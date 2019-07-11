### `getCompanyFilings`
***
***

### Description

 Returns a complete list of SEC filings for the Company with the given `identifier`

### Usage
```r
getCompanyFilings(identifier, opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Company identifier (Ticker, CIK, LEI, Intrinio ID)
```opts```     |     named list Optional parameters
```opts$report_type```     |     String Filter by <a href=&quot;/documentation/sec_filing_report_types&quot; target=&quot;_blank&quot;>report type</a>. Separate values with commas to return multiple report types.
```opts$start_date```     |     String Date YYYY-MM-DD Filed on or after the given date
```opts$end_date```     |     String Date YYYY-MM-DD Filed before or after the given date
```opts$page_size```     |     Number The number of results to return (default to 100)
### Value

 filings tibble 

### Seealso

 Other company endpoints: [`getAllCompanies`](getAllCompanies.md) ,
  [`getCompanyDataPointHistory`](getCompanyDataPointHistory.md) ,
  [`getCompanyDataPointNumber`](getCompanyDataPointNumber.md) ,
  [`getCompanyDataPointText`](getCompanyDataPointText.md) ,
  [`getCompanyFundamentals`](getCompanyFundamentals.md) ,
  [`getCompanyIPOs`](getCompanyIPOs.md) ,
  [`getCompanyNews`](getCompanyNews.md) ,
  [`getCompanySecurities`](getCompanySecurities.md) ,
  [`getCompany`](getCompany.md) 

