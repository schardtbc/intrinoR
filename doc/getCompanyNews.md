### `getCompanyNews`

Returns news for the Company with the given `identifier`

### Usage

```r
getCompanyNews(identifier, opts = list(), max_n = 10)
```

### Arguments

Argument      |Description
------------- |----------------
```identifier```     |     A Company identifier (Ticker, CIK, LEI, Intrinio ID)
```opts```     |     named list Optional query parameters
```max_n```     |     number maximum results to return (defaults to 10)
```opts$page_size```     |     number Number of results returned per page default = 100

### Other company endpoints
  
  [`getAllCompanies`](getAllCompanies.html) ,
  [`getCompanyDataPointHistory`](getCompanyDataPointHistory.html) ,
  [`getCompanyDataPointNumber`](getCompanyDataPointNumber.html) ,
  [`getCompanyDataPointText`](getCompanyDataPointText.html) ,
  [`getCompanyIPOs`](getCompanyIPOs.html) ,
  [`getCompanySecurities`](getCompanySecurities.html) 


