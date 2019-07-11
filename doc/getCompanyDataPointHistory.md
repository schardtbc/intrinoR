### `getCompanyDataPointHistory`
***
***

### Description

 historical values data-point tag for a company over specified time range

### Usage
```r
getCompanyDataPointHistory(identifier, tag, opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A company identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
```tag```     |     String An Intrinio data tag ID or code
```opts```     |     named list Optional query params for endpoint
```opts$start_date```     |     Date YYYY-MM-DD Return prices on or after the date
```opts$end_date':```     |     Date YYYY-MM-DD Return prices on or before the date
```opts$sort_order```     |     String = "desc" desc | asc
```opts$frequency:```     |     String = "daily" daily | weekly | monthly | quarterly | yearly Return stock prices in the given frequency
```opts$type```     |     String FY | QTR | TTM Return historical data for given fiscal period type
```opts$page_size':```     |     number = 100 The number of results to return per page
### Seealso

 [https://data.intrinio.com/data-tags](https://data.intrinio.com/data-tags) 
 
 Other company endpoints: [`getAllCompanies`](getAllCompanies.md) ,
  [`getCompanyDataPointNumber`](getCompanyDataPointNumber.md) ,
  [`getCompanyDataPointText`](getCompanyDataPointText.md) ,
  [`getCompanyFilings`](getCompanyFilings.md) ,
  [`getCompanyFundamentals`](getCompanyFundamentals.md) ,
  [`getCompanyIPOs`](getCompanyIPOs.md) ,
  [`getCompanyNews`](getCompanyNews.md) ,
  [`getCompanySecurities`](getCompanySecurities.md) ,
  [`getCompany`](getCompany.md) 

